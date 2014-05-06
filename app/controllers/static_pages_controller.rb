class StaticPagesController < ApplicationController
  def home
  end

  def events
  end

  def classes
  end

  def apply
  end

  def apply_email
    form = params[:application]
    ContactMailer.membership_application(form).deliver
    redirect_to apply_confirmation_url, notice: "Your application was successfully submitted"
  end

  def apply_confirmation
  end
end
