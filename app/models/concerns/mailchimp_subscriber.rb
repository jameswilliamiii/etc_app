class MailchimpSubscriber

  def initialize(email)
    @email = email
  end

  def add_to_email_list
    Mailchimp::API.new(ENV['MC_API_KEY']).list_subscribe({
                                                            :id => ENV["MC_CURRENT_USER_LIST_ID"],
                                                            :email_address => @email,
                                                            :merge_vars => {},
                                                            :double_optin => false,
                                                            :update_existing => true
                                                          })
  end

end