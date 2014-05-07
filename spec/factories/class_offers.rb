# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :class_offer do
    summary "MyText"
    start_date "2014-05-07"
    end_date "2014-05-07"
    non_member_cost "MyString"
    standard_member_cost "MyString"
    premier_member_cost "MyString"
    teacher "MyString"
    teacher_profile "MyText"
    requirements "MyText"
    whats_included "MyText"
    learning_points "MyText"
  end
end
