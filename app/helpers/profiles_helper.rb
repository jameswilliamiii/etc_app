module ProfilesHelper
  def last_skill(skill, skill_list)
    skill == skill_list.last
  end

  def is_active_sub_nav?(member_level)
    "active" if params[:membership_type] == member_level
  end

  def search_or_tag_params_present?
    params[:search].present? || params[:skill].present?
  end
end
