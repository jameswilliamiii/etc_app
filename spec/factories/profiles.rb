# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    name "MyString"
    company "MyString"
    public false
    details "MyText"
    twitter "MyString"
    facebook "MyString"
    linkedin "MyString"
    github "MyString"
    website "MyString"
    email "MyString"
  end
end
