# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Deleting all current users"
User.destroy_all
puts "Deleting all current profiles"
Profile.destroy_all
puts "Creating new user accounts"
users = User.create([
                      {first_name: "James", last_name: "Stubblefield", password: "12345678", password_confirmation: "12345678", email: "jameswilliamiii@gmail.com", membership_type: "premier", member_since: 90.days.ago, invitation_accepted_at: Time.now}
                      # {first_name: "Mike", last_name: "Copeland", password: "12345678", password_confirmation: "12345678", email: "mscopeland@gmail.com", membership_type: "premier", member_since: 300.days.ago, invitation_accepted_at: Time.now},
                      # {first_name: "Justin", last_name: "Love", password: "12345678", password_confirmation: "12345678", email: "mail@justinlove.name", membership_type: "standard", member_since: 120.days.ago, invitation_accepted_at: Time.now},
                      # {first_name: "Troy", last_name: "Bjerke", password: "12345678", password_confirmation: "12345678", email: "troy.bjerke@gmail.com", membership_type: "premier", member_since: 30.days.ago, invitation_accepted_at: Time.now},
                      # {first_name: "Julia", last_name: "Hsia", password: "12345678", password_confirmation: "12345678", email: "julia.y.hsia@gmail.com", membership_type: "standard", member_since: 60.days.ago, invitation_accepted_at: Time.now},
                      # {first_name: "Some", last_name: "Dude", password: "12345678", password_confirmation: "12345678", email: "test@test.com", membership_type: "premier", member_since: 10.days.ago, invitation_accepted_at: Time.now},
                      # {first_name: "Another", last_name: "Dude", password: "12345678", password_confirmation: "12345678", email: "test2@test.com", membership_type: "standard", member_since: 10.days.ago, invitation_accepted_at: Time.now}
                    ])
# lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque, non, quae sequi asperiores minus amet sed molestias dolore voluptate ex culpa facere nostrum ipsam. Quia, ipsam soluta totam iste tenetur."
# puts "Creating new profiles"
# skills_list_array = "html5, css3, ruby, ruby on rails, lean startup, entrepreneurship, social media, marketing, project management, javascript, startups, mentorship, project management, video production, print design, php, python".gsub(",", "").split
# users.each{ |u| Profile.create(name: u.name, public: true, details: lorem, email: u.email, profile_type: ['personal', 'company'].sample, user_id: u.id, skill_list: skills_list_array.sample(4)) }
# profiles = Profile.where profile_type: "company"
# profiles.each{ |p| p.update_attributes company: "Elgin Technology Center" }

puts "Assigning admin status"
u = User.find_by_email('jameswilliamiii@gmail.com')
u.admin = true
u.save

# u = User.find_by_email('mscopeland@gmail.com')
# u.admin = true
# u.save

puts "Completed seed"