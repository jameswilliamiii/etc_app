class Profile < ActiveRecord::Base
  include PgSearch

  belongs_to :user

  has_attached_file :avatar, styles: { large: ["500x500>"], medium: ["300x300", :png], thumb: ["150x150#", :png] },
                             processors: [ :cropper ],
                             default_url: "https://d33z4cqleaobgx.cloudfront.net/assets/empty_profile_photo.png",
                             storage: :s3,
                             s3_credentials: { bucket: ENV['S3_BUCKET'], access_key_id: ENV['S3_ACCESS_KEY'], secret_access_key: ENV['S3_SECRET_ACCESS_KEY'] }

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  validates_presence_of [ :name, :profile_type, :user_id ]
  validates_attachment :avatar, content_type: { :content_type => ["image/jpg", "image/gif", "image/png", "image/jpeg"], message: "must be png, jpg, or gif format" }

  after_update :reprocess_avatar, :if => :cropping?

  acts_as_taggable_on :skills

  default_scope {ordered_by_membership_type}

  pg_search_scope :search_by_name_or_skill, against: [ :name, :company ], associated_against: {:skills => :name}, using: { tsearch: { prefix: true, dictionary: 'english' } }

  paginates_per 6

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def avatar_geometry(style = :original)
    @geometry ||= {}
    avatar_path = (avatar.options[:storage] == :s3) ? avatar.url(style) : avatar.path(style)
    @geometry[style] ||= Paperclip::Geometry.from_file(avatar_path)
  end

  def self.ordered_by_membership_type
    joins(:user).order('membership_type DESC').order('member_since ASC').readonly(false)
  end

  def self.filter(attributes)
    attributes.inject(self) do |scope, (key, value)|
      return scope if value.blank?
      case key.to_sym
      when :skill
        scope.unscoped.tagged_with(value.downcase, :any => true, :wild => true)
      when :membership_type
        if value == "companies"
          scope.where(["profile_type = ?", "company"])
        elsif value == "premier"
          scope.joins(:user).where(["membership_type = ?", "premier"])
        elsif value == "standard"
          scope.joins(:user).where(["membership_type = ?", "standard"])
        else
          scope
        end
      when :search
        scope.search_by_name_or_skill(value)
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
