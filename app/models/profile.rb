class Profile < ActiveRecord::Base
  acts_as_taggable_on :skills

  belongs_to :user

  has_attached_file :avatar, styles: { large: ["500x500>"], medium: ["300x300", :png], thumb: ["150x150#", :png] },
                             processors: [ :cropper ],
                             # convert_options: {medium: "-gravity center -extent 320x320", thumb: "-gravity center -extent 160x160"},
                             default_url: "/assets/empty_profile_photo.png",
                             storage: :s3,
                             s3_credentials: { bucket: ENV['S3_BUCKET'], access_key_id: ENV['S3_ACCESS_KEY'], secret_access_key: ENV['S3_SECRET_ACCESS_KEY'] }

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  validates_presence_of [ :name, :profile_type, :user_id ]
  validates_attachment :avatar, content_type: { :content_type => ["image/jpg", "image/gif", "image/png", "image/jpeg"], message: "must be png, jpg, or gif format" }

  after_update :reprocess_avatar, :if => :cropping?

  paginates_per 6

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def avatar_geometry(style = :original)
    @geometry ||= {}
    avatar_path = (avatar.options[:storage] == :s3) ? avatar.url(style) : avatar.path(style)
    @geometry[style] ||= Paperclip::Geometry.from_file(avatar_path)
  end

  def self.filter(attributes)
    attributes.inject(self) do |scope, (key, value)|
      return scope if value.blank?
      case key.to_sym
      when :skill
        scope.tagged_with(value.downcase, :any => true, :wild => true)
      when :membership_type
        if value == "companies"
          scope.where(["profile_type = ?", "company"])
        elsif value == "premier"
          scope.joins(:user).where(["profile_type = ? AND membership_type = ?", "personal", "premier"])
        elsif value == "member"
          scope.joins(:user).where(["profile_type = ? AND membership_type = ?", "personal", "member"])
        else
          scope
        end
      when :search
        scope.joins(:skills).where("LOWER(profiles.name) ILIKE ? OR LOWER(profiles.company) ILIKE ? OR LOWER(tags.name) ILIKE ?", "%#{value.downcase}%", "%#{value.downcase}%", "%#{value.downcase}" ).group("profiles.id")
      else
        scope
      end
    end
  end

  def is_public?
    self.public = true
  end

  def is_personal?
    self.profile_type == "personal"
  end

  private
  def reprocess_avatar
    avatar.assign(avatar)
    avatar.save
  end

end
