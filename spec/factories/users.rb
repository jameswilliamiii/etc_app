# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
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
      before :create do |user|
        user.membership_type = "standard"
        user.save
      end
    end
  end
end
