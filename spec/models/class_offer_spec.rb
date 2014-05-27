require 'spec_helper'

describe ClassOffer do
  it "should have a valid factory" do
    build(:class_offer).should be_valid
  end
  it "should have a valid saved_class_offer factory" do
    build(:saved_class_offer).should be_valid
  end
  it "should have a valid closed_class_offer factory" do
    build(:closed_class_offer).should be_valid
  end
  it "should be invalid without a name " do
    build(:class_offer, name: nil).should_not be_valid
  end
  it "should be invalid without a summary" do
    build(:class_offer, summary: nil).should_not be_valid
  end
  it "should be invalid without a start_date" do
    build(:class_offer, start_date: nil).should_not be_valid
  end
  it "should be invalid without an end_date" do
    build(:class_offer, end_date: nil).should_not be_valid
  end
  it "should be invalid without a time" do
    build(:class_offer, time: nil).should_not be_valid
  end
  it "should be invalid without a non_member_cost" do
    build(:class_offer, non_member_cost: nil).should_not be_valid
  end
  it "should be invalid without a standard_member_cost" do
    build(:class_offer, standard_member_cost: nil).should_not be_valid
  end
  it "should be invalid without a premier_member_cost" do
    build(:class_offer, premier_member_cost: nil).should_not be_valid
  end
  it "should be invalid without a teacher" do
    build(:class_offer, teacher: nil).should_not be_valid
  end
  it "should be invalid without a teacher_profile" do
    build(:class_offer, teacher_profile: nil).should_not be_valid
  end
  it "should be invalid without learning_points" do
    build(:class_offer, learning_points: nil).should_not be_valid
  end
  it "should be invalid without a link" do
    build(:class_offer, link: nil).should_not be_valid
  end
  it "should be invalid without an attachment with a 'jpg, jpeg, gif, or png' format"
  it "should only return active class offers"
  it "should return false if a class_offer status is not equal active"
  it "should return false if a class_offer status is not equal to closed"
  it "should return false if a class_offer status is not equal to saved"
  describe "updates cost to remove $ and makes everything uppercase" do
    it "should update non_member_cost to remove $ from the string"
    it "should update standard_member_cost to remove $ from the string"
    it "should update premier_member_cost to remove $ from the string"
    it "should update non_member_cost to make text uppercase"
    it "should update standard_member_cost to make text uppercase"
    it "should update premier_member_cost to make text uppercase"
    it "should validate the attachment type for :avatar"
  end
end
