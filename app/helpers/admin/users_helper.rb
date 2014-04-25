module Admin::UsersHelper
  def invitation_status(user)
    if user.invitation_accepted?
      "<span class='label success'>ACCEPTED</span>".html_safe
    else
      "<span class='label secondary'>PENDING</span>".html_safe
    end
  end
end