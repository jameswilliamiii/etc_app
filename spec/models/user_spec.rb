require 'spec_helper'

describe User do
  it "should have a valid factory"
  it {should have_many(:profiles)}
  it "should be invalid without an email"
  it "should be invalid without a first_name"
  it "should be invalid without a last_name"
  it "should be invalid without a membership_type"
  it "should be invalid without a member_since"
  it "should return a valid first and lat name combined"
  it "should validate that profiles are present"
  it "should validate if an email invitation was accepted"
  it "should return the user's profile"
  context "search by name or company" do
    it "should return items matching a user's name"
    it "should return items matching a company's name"
  end
  context "should add a user's email to the Mailchimp list" do
    it "should add a premier member to the Members Group / Premier "
    it "should add a standard member to the Members Group / Standard "
  end
  context "should remove a user's email from the Members Group" do
    it "should remove the user's email from Members Group / Premier "
    it "should remove the user's email from Members Group / Standard "
  end
end
