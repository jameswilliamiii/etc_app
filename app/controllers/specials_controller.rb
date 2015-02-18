class SpecialsController < ApplicationController

  def show
    @name = params[:campaign]
  end

  def email
    name = params[:name]
    email = params[:email]
    phone = params[:phone].first
    comments = params[:comments]
    campaign = params[:campaign]
    plan = params[:plan]
    AdCampaignMailer.form_submission(name, email, phone, comments, campaign, plan).deliver
    redirect_to special_url(campaign), notice: "Thanks for your interest in coworking with us. We will get in touch with you soon."
  end

end