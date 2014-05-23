require 'spec_helper'

describe ClassOffer do
  it "should have a valid factory"
  it "should have a valid saved_class_offer factory"
  it "should have a valid closed_class_offer factory"
  it "should be invalid without a name "
  it "should be invalid without a summary"
  it "should be invalid without a start_date"
  it "should be invalid without an end_date"
  it "should be invalid without a time"
  it "should be invalid without a non_member_cost"
  it "should be invalid without a standard_member_cost"
  it "should be invalid without a premier_member_cost"
  it "should be invalid without a teacher"
  it "should be invalid without a teacher_profile"
  it "should be invalid without learning_points"
  it "should be invalid without a link"
  it "should be invalid without an attachment with a 'jpg, jpeg, gif, or png' format"
  it "should only return active class offers"
  it "should return false if a class_offer status is not equal active"
  it "should return false if a class_offer status is not equal to closed"
  it "should return false if a class_offer status is not equal to saved"
  context "updates cost to remove $ and makes everything uppercase" do
    it "should update non_member_cost to remove $ from the string"
    it "should update standard_member_cost to remove $ from the string"
    it "should update premier_member_cost to remove $ from the string"
    it "should update non_member_cost to make text uppercase"
    it "should update standard_member_cost to make text uppercase"
    it "should update premier_member_cost to make text uppercase"
  end
end
