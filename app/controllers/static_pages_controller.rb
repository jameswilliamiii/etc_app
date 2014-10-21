class StaticPagesController < ApplicationController
  def home
  end

  def events
  end

  def apply
  end

  def apply_email
    form = params[:application]
    MailchimpSubscriber.new(params[:application]['email']).delay.add_to_email_list
    ContactMailer.delay.membership_application(form)
    redirect_to apply_confirmation_url, notice: "Your application was successfully submitted"
  end

  def apply_confirmation
  end

end