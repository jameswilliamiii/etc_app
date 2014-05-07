class ClassOffer < ActiveRecord::Base
  has_many :faqs, :dependent => :destroy
  validates_presence_of [ :summary, :start_date, :end_date, :non_member_cost, :standard_member_cost, :premier_member_cost, :teacher, :teacher_profile, :learning_points ]
  before_create :make_class_active

  def self.active
    where status: "active"
  end

  private

  def make_class_active
    self.status = "active"
  end
end
