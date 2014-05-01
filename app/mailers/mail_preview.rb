class MailPreview < MailView

  def invitation_instructions
    user = User.first
    user.invite! { |u| u.skip_invitation = true }
    Devise::Mailer.invitation_instructions(user, user.invitation_token)
  end

  def reset_password_instructions
    user = User.first
    Devise::Mailer.reset_password_instructions(user, user.reset_password_token)
  end

end