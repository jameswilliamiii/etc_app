class User < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_by_full_name_or_company, against: [ :first_name, :last_name ], associated_against: {:profiles => :company}, using: { tsearch: { prefix: true, dictionary: 'english' } }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :profiles

  after_create :add_to_mailchimp_list #if Rails.env.production?
  after_update :add_to_mailchimp_list #if Rails.env.production?
  after_destroy :mailchimp_group_deactivated

  validates_presence_of [ :email, :first_name, :last_name, :membership_type, :member_since ]

  def is_admin?
    self.admin == true
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def has_profile?
    self.profiles.present?
  end

  def invitation_accepted?
    self.invitation_accepted_at.present?
  end

  def profile
    self.profiles.first
  end

  def self.filter(attributes)
    attributes.inject(self) do |scope, (key, value)|
      return scope if value.blank?
      case key.to_sym
      when :search
        scope.search_by_full_name_or_company(value)
      else
        scope
      end
    end
  end

  def add_to_mailchimp_list
    if self.membership_type == "premier"
      self.mailchimp_group_premier
    elsif self.membership_type == "standard"
      self.mailchimp_group_standard
    end
  end

  def mailchimp_group_premier
    Mailchimp::API.new(ENV['MC_API_KEY']).list_subscribe({
                                                            :id => ENV["MC_CURRENT_USER_LIST_ID"],
                                                            :email_address => self.email,
                                                            :merge_vars => {:GROUPINGS => {0 => {:name => "Member Groups", :groups => "Premier"}}},
                                                            :double_optin => false,
                                                            :update_existing => true
                                                          })
  end

  def mailchimp_group_standard
    Mailchimp::API.new(ENV['MC_API_KEY']).list_subscribe({
                                                            :id => ENV["MC_CURRENT_USER_LIST_ID"],
                                                            :email_address => self.email,
                                                            :merge_vars => {:GROUPINGS => {0 => {:name => "Member Groups", :groups => "Standard"}}},
                                                            :double_optin => false,
                                                            :update_existing => true
                                                          })
  end

  def mailchimp_group_deactivated
    Mailchimp::API.new(ENV['MC_API_KEY']).list_update_member({
                                                              :id => ENV["MC_CURRENT_USER_LIST_ID"],
                                                              :email_address => self.email,
                                                              :merge_vars => {:GROUPINGS => {0 => {:name => "Member Groups", :groups => "Deactivated"}}},
                                                              :double_optin => false,
                                                              :update_existing => true
                                                            })
  end

  # Use delayed_job to handle these background tasks including sending all devise and devise_invitable mailers.  These calls must remain below the method declarations.
  handle_asynchronously :mailchimp_group_premier
  handle_asynchronously :mailchimp_group_standard
  handle_asynchronously :send_devise_notification, :queue => 'devise' if Rails.env.production?

end