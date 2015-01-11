class SpecialsController < ApplicationController

  def show
    @name = params[:campaign]
  end

  def email
    name = params[:name]
    email = params[:email]
    phone = params[:phone]
    campaign = params[:campaign]
    AdCampaignMailer.form_submission(name, email, phone, campaign).deliver
    redirect_to special_url(campaign), notice: "Thanks for your interest in coworking with us. We will get in touch with you soon."
  end

end