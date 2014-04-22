class Profile < ActiveRecord::Base
  acts_as_taggable_on :skills

  def self.filter(attributes)
    attributes.inject(self) do |scope, (key, value)|
      return scope if value.blank?
      case key.to_sym
      when :skill
        scope.tagged_with(value.downcase, :any => true, :wild => true)
      # when :type
      #   if value == "companies"
      #     scope.where(["profile_type > ?", "company"])
      #   elsif value == "premier"
      #     scope.where(["profile_type > ?", "premier"])
      #   elsif value == "at"
      #     scope.where(["profile_type > ?", "member"])
      #   else
      #     scope
      #   end
      when :search
        scope.joins(:skills).where("LOWER(profiles.name) LIKE ? OR LOWER(profiles.company) LIKE ? OR LOWER(tags.name) LIKE ?", "%#{value.downcase}%", "%#{value.downcase}%", "%#{value.downcase}" )
      else
        scope
      end
    end
  end
end
