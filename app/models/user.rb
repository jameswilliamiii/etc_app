class User < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_by_full_name_or_company, against: [ :first_name, :last_name ], associated_against: {:profiles => :company}, using: { tsearch: { prefix: true, dictionary: 'english' } }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :profiles

  validates_presence_of [ :email, :first_name, :last_name, :membership_type ]

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
end
