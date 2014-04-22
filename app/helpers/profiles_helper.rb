module ProfilesHelper
  def last_skill(skill, skill_list)
    skill == skill_list.last
  end
end
