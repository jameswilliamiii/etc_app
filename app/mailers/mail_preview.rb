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

  def membership_application
    form = {
              "membership_type"=>"premier",
              "first_name"=>"John",
              "last_name"=>"Doe",
              "email"=>"test@test.com",
              "address"=>"111 Some St.",
              "city"=>"Elgin",
              "state"=>"IL",
              "zip"=>"60120",
              "phone"=>"1234567890",
              "business"=>"Acme Inc.",
              "url"=>"http://google.com",
              "ques_1"=>"3 years and some change",
              "ques_2"=>"We are working on some amazing things like teleportation.",
              "ques_3"=>"I am a natural born killer when it comes to forming successful businesses.",
              "ques_4"=>"All kinds of great tools like ruby, rails, and a whole bunch of tools that have abbreviations.",
              "ques_5"=>"Give back?  I am a taker, not a giver!",
              "ques_6"=>"RELAUNCH"
            }
    ContactMailer.membership_application(form)
  end

end