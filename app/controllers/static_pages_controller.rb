class StaticPagesController < ApplicationController
  def home
  end

  def events
  end

  def classes
    @class_offers = ClassOffer.active
  end

  def apply
  end

  def apply_email
    form = params[:application]
    add_to_email_list(params[:application]['email']) if Rails.env.production?
    ContactMailer.membership_application(form).deliver
    redirect_to apply_confirmation_url, notice: "Your application was successfully submitted"
  end

  def apply_confirmation
  end

  private

  def add_to_email_list(email)
    Mailchimp::API.new(ENV['MC_API_KEY']).list_subscribe({
                                                            :id => ENV["MC_CURRENT_USER_LIST_ID"],
                                                            :email_address => email,
                                                            :merge_vars => {},
                                                            :double_optin => false,
                                                            :update_existing => true
                                                          })
  end
end
