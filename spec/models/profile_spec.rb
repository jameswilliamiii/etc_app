require 'spec_helper'

describe Profile do
  it "should have a valid factory"
  it "should be invalid without a name"
  it "should be invalid without a profile_type"
  it "should be invalid without a  user_id"
  it { should belong_to(:user) }
  context "return by membership_type & member_since" do
    it "should should return items ordered by membership_type"
    it "should should return items ordered by member_since in ASC order"
  end
  it "should should return items ordered by membership_type"
  it "should filter results by a skill"
  it "should filter results by membership_type"
  it "should be be invalid if profile is not public"
  it "should only show profiles which are public"
  it { should have_db_index(:profile_type) }
end
