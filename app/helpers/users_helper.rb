module UsersHelper
  def profile_visibility(profile)
    if profile.is_public?
      "Everyone"
    else
      "Only ETC members"
    end
  end
end