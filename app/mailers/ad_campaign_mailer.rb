class AdCampaignMailer < ActionMailer::Base
  default from: "Elgin Technology Center <info@elgintech.org>"

  def form_submission(name, email, phone, comments, campaign, plan)
    @name = name
    @email = email
    @phone = phone
    @comments = comments
    @campaign = campaign
    @plan = plan
    mail to: "info@elgintech.org", subject: "New Campaign Form Submission: #{@campaign}"
  end
end
