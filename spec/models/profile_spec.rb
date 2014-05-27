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
    it "should should return items ordered by membership_type"
    it "should should return items ordered by member_since in ASC order"
  end
  it "should should return items ordered by membership_type"
  it "should filter results by a skill"
  it "should filter results by membership_type"
  it "should be false if profile is not public" do
    profile = build(:private_profile)
    profile.is_public?.should be false
  end
  it "should only show profiles which are public"
  it { should have_db_index(:profile_type) }
end
