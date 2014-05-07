class Faq < ActiveRecord::Base
  belongs_to :class_offer
  validates_presence_of [ :question, :answer ]
end
