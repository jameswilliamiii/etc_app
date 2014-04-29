class Profile < ActiveRecord::Base
  acts_as_taggable_on :skills

  belongs_to :user

  has_attached_file :avatar, styles: { medium: ["300x300", :png], thumb: ["150x150", :png] },
                             convert_options: {medium: "-gravity center -extent 320x320", thumb: "-gravity center -extent 160x160"},
                             default_url: "/assets/empty_profile_photo.png",
                             storage: :s3,
                             s3_credentials: { bucket: ENV['S3_BUCKET'], access_key_id: ENV['S3_ACCESS_KEY'], secret_access_key: ENV['S3_SECRET_ACCESS_KEY'] }

  validates_presence_of [ :name, :profile_type, :user_id ]
  validates_attachment :avatar, content_type: { :content_type => ["image/jpg", "image/gif", "image/png", "image/jpeg"], message: "must be png, jpg, or gif format" }

  paginates_per 6

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
end
