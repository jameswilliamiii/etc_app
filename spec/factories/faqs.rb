# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :faq do
    question "MyText"
    answer "MyText"
    class_offer_id 1
  end
end
