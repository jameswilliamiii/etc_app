# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    name "MyString"
    company "MyString"
    public true
    details "MyText"
    twitter "MyString"
    facebook "MyString"
    linkedin "MyString"
    github "MyString"
    website "MyString"
    email "MyString"
    profile_type "personal"
    association :user
    factory :private_profile do
      public false
    end
  end
end
