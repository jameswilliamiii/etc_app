class AdCampaignMailer < ActionMailer::Base
  default from: "Elgin Technology Center <info@elgintech.org>"

  def form_submission(name, email, phone, campaign)
    @name = name
    @email = email
    @phone = phone
    @campaign = campaign
    mail to: "info@elgintech.org", subject: "New Campaign Form Submission: #{@campaign}"
  end
end
