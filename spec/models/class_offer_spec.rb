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
  it "should only return active class offers" do
    active_class_offer = create :class_offer
    saved_class_offer = create :saved_class_offer
    closed_class_offer = create :closed_class_offer
    ClassOffer.active.should_not include saved_class_offer, closed_class_offer
    ClassOffer.active.should include active_class_offer
  end
  it "should return false if a class_offer status is not equal active" do
    build(:class_offer).is_active?.should be true
    build(:saved_class_offer).is_active?.should_not be true
    build(:closed_class_offer).is_active?.should_not be true
  end
  it "should return false if a class_offer status is not equal to closed" do
    build(:closed_class_offer).is_closed?.should be true
    build(:saved_class_offer).is_closed?.should_not be true
    build(:class_offer).is_closed?.should_not be true
  end
  it "should return false if a class_offer status is not equal to saved" do
    build(:saved_class_offer).is_saved?.should be true
    build(:class_offer).is_saved?.should_not be true
    build(:closed_class_offer).is_saved?.should_not be true
  end
  describe "updates cost to remove $ and makes everything uppercase" do
    it "should update non_member_cost to remove $ from the string" do
      create(:class_offer, non_member_cost: "$1").non_member_cost.should_not eq "$1"
      create(:class_offer, non_member_cost: "$1").non_member_cost.should eq "1"
    end
    it "should update standard_member_cost to remove $ from the string" do
      create(:class_offer, standard_member_cost: "$1").standard_member_cost.should_not eq "$1"
      create(:class_offer, standard_member_cost: "$1").standard_member_cost.should eq "1"
    end
    it "should update premier_member_cost to remove $ from the string" do
      create(:class_offer, premier_member_cost: "$1").premier_member_cost.should_not eq "$1"
      create(:class_offer, premier_member_cost: "$1").premier_member_cost.should eq "1"
    end
    it "should update non_member_cost to make text uppercase" do
      create(:class_offer, non_member_cost: "free").non_member_cost.should_not eq "free"
      create(:class_offer, non_member_cost: "free").non_member_cost.should eq "FREE"
    end
    it "should update standard_member_cost to make text uppercase" do
      create(:class_offer, standard_member_cost: "free").standard_member_cost.should_not eq "free"
      create(:class_offer, standard_member_cost: "free").standard_member_cost.should eq "FREE"
    end
    it "should update premier_member_cost to make text uppercase" do
      create(:class_offer, premier_member_cost: "free").premier_member_cost.should_not eq "free"
      create(:class_offer, premier_member_cost: "free").premier_member_cost.should eq "FREE"
    end
    it "should validate the attachment type for :avatar"
    it "should be invalid without an attachment with a 'jpg, jpeg, gif, or png' format"
  end
end
