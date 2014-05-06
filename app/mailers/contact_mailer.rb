class ContactMailer < ActionMailer::Base
  default from: "Elgin Technology Center <info@elgintech.org>"

  def membership_application(form)
    @form = form
    @applicant = "#{@form['first_name']} #{@form['last_name']}"
    mail to: "info@elgintech.org", subject: "New Membership Application: #{@applicant}"
  end
end
