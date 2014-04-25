class Profile < ActiveRecord::Base
  acts_as_taggable_on :skills
  belongs_to :user
  validates_presence_of [ :name, :profile_type, :user_id ]
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
        scope.joins(:skills).where("LOWER(profiles.name) LIKE ? OR LOWER(profiles.company) LIKE ? OR LOWER(tags.name) LIKE ?", "%#{value.downcase}%", "%#{value.downcase}%", "%#{value.downcase}" ).group("profiles.id")
      else
        scope
      end
    end
  end
end
