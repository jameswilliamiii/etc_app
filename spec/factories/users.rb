# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "test@test.com"
    password "12345678"
    password_confirmation "12345678"
    membership_type "premier"
    member_since Date.today
    first_name "FirstName"
    last_name "LastName"
    factory :admin do
      after :create do |user|
        user.email = "admin@test.com"
        user.admin = true
        user.save
      end
    end
    factory :standard_member do
      after :create do |user|
        user.update_attributes membership_type: "standard"
      end
    end
  end
end
