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

  def profile_member_type(profile)
    if profile.profile_type == "company"
      "Company"
    else
      profile.user.membership_type.titleize
    end
  end

  def profile_name(profile)
    if profile.is_personal?
      profile.name
    else
      profile.company
    end
  end
end
