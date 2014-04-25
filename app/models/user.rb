class User < ActiveRecord::Base
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
end
