require 'spec_helper'

describe Profile do
  it "should have a valid factory" do
    build(:profile).should be_valid
  end
  it "should have a valid :prive_profile factory" do
    build(:private_profile).should be_valid
  end
  it "should be invalid without a name" do
    build(:profile, name: nil).should_not be_valid
  end
  it "should be invalid without a profile_type" do
    build(:profile, profile_type: nil).should_not be_valid
  end
  it "should be invalid without a  user_id" do
    build(:profile, user_id: nil).should_not be_valid
  end
  it { should belong_to(:user) }
  describe "return by membership_type & member_since" do
    it "should should return items ordered by membership_type" do
      premier_member = create :profile
      standard_member = create(:profile, user: create(:standard_member))
      premier_member = create :profile
      Profile.last.should eq standard_member
    end
    it "should should return items ordered by member_since in ASC order" do
      oldest = create(:profile, user: create(:user, member_since: 3.days.ago))
      youngest = create(:profile, user: create(:user, member_since: 1.day.ago))
      middle = create(:profile, user: create(:user, member_since: 2.days.ago))
      Profile.last.should eq youngest
    end
  end
  describe "should filter results by a skill" do
    it "should return item when skill matches" do
      premier_member = create :profile, skill_list: "ruby"
      Profile.filter({ "skill" => "ruby" }).should include premier_member
    end
    it "should not return object when skill does not match" do
      premier_member = create :profile, skill_list: "ruby"
      Profile.filter({ "skill" => "html" }).should_not include premier_member
    end
  end
  describe "should filter results by membership_type" do
    it "should include the premier_member user profile" do
      @premier_member = create :profile
      @standard_member = create(:profile, user: create(:standard_member))
      Profile.filter({ "membership_type" => "premier" }).should include @premier_member
    end
    it "should exclude the standard_member user profile" do
      @premier_member = create :profile
      @standard_member = create(:profile, user: create(:standard_member))
      Profile.filter({ "membership_type" => "premier" }).should_not include @standard_member
    end
  end
  it "should be false if profile is not public" do
    profile = build(:private_profile)
    profile.is_public?.should be false
  end
  it "should only show profiles which are public" do
    profile = create(:private_profile)
    Profile.only_public.should_not include profile
  end
  it { should have_db_index(:profile_type) }
  it "should validate the attachment type for :avatar"
  it "should be invalid without an attachment with a 'jpg, jpeg, gif, or png' format"
end
