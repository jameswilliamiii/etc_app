require 'spec_helper'

describe User do
  it "should have a valid factory" do
    build(:user).should be_valid
  end
  it {should have_many(:profiles)}
  it "should be invalid without an email" do
    build(:user, email: nil).should_not be_valid
  end
  it "should be invalid without a first_name" do
    build(:user, first_name: nil).should_not be_valid
  end
  it "should be invalid without a last_name" do
    build(:user, last_name: nil).should_not be_valid
  end
  it "should be invalid without a membership_type" do
    build(:user, membership_type: nil).should_not be_valid
  end
  it "should be invalid without a member_since" do
    build(:user, member_since: nil).should_not be_valid
  end
  it "should return a valid first and last name combined" do
    u = build(:user)
    u.name.should eq("#{u.first_name} #{u.last_name}")
  end
  it "should validate that profiles are present" do
    profile = create(:profile)
    user = profile.user
    user.has_profile?.should be true
  end
  describe "should validate if an email invitation was accepted or not" do
    it "should validate email invitation accepted" do
      user = create(:user)
      user.update_attributes invitation_accepted_at: Time.now
      user.invitation_accepted?.should be true
    end
    it "should validate email invitation not accepted" do
      user = create(:user)
      user.invitation_accepted?.should be false
    end
  end
  it "should return the user's profile" do
    profile = create(:profile)
    user = profile.user
    user.profile.should eq Profile.last
  end
  describe "search by name or company" do
    it "should return items matching a user's name" do
      user = create :user, first_name: "John", last_name: "Doe"
      User.filter({ "search" => "John" }).should include user
      User.filter({ "search" => "James" }).should_not include user
    end
    it "should return items matching a company's name" do
      user = create :user, first_name: "John", last_name: "Doe"
      profile = create :company_profile, user: user, company: "ETC"
      User.filter({ "search" => "ETC" }).should include user
      User.filter({ "search" => "Elgin Technology Center" }).should_not include user
    end
  end
  it { should have_db_index(:email).unique(true) }
  it { should have_db_index(:invitation_token).unique(true) }
  it { should have_db_index(:invitations_count) }
  it { should have_db_index(:invited_by_id) }
  it { should have_db_index(:membership_type) }
  it { should have_db_index(:reset_password_token).unique(true) }
  describe "should add a user's email to the Mailchimp list" do
    it "should add a premier member to the Members Group / Premier "
    it "should add a standard member to the Members Group / Standard "
  end
  describe "should remove a user's email from the Members Group" do
    it "should remove the user's email from Members Group / Premier "
    it "should remove the user's email from Members Group / Standard "
  end
end
