class Profile < ActiveRecord::Base
  acts_as_taggable_on :skills

  belongs_to :user

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "150x150>" }, :default_url => "/images/:style/missing.png"

  crop_attached_file :avatar

  validates_presence_of [ :name, :profile_type, :user_id ]
  validates_attachment :avatar, :content_type => { :content_type => ["image/jpg", "image/gif", "image/png"] }
  validates_attachment_content_type :avatar, :content_type => /\Aimage/
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]

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
