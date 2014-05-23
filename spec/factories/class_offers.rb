# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :class_offer do
    summary "MyText"
    start_date 2.days.ago
    end_date Date.tomorrow
    non_member_cost "MyString"
    standard_member_cost "MyString"
    premier_member_cost "MyString"
    teacher "MyString"
    teacher_profile "MyText"
    status "active"
    name "MyText"
    link "http://google.com"
    time "6PM"
    requirements "MyText"
    learning_points "MyText, MyText2"
    factory :saved_class_offer do
        status "saved"
    end
    factory :closed_class_offer do
        status "closed"
    end
  end
end
