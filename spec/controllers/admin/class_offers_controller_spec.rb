require 'spec_helper'

describe Admin::ClassOffersController do

  before(:each) do
    @admin = create :admin
    sign_in @admin
  end

  describe "GET 'index'" do
    it "renders :index template" do
      get 'index'
      response.should render_template :index
    end
  end

  describe "GET 'show'" do
    it "renders :show template" do
      get 'show', id: create(:class_offer)
      response.should render_template :show
    end
  end

  describe "GET 'new'" do
    it "renders :new template" do
      get 'new'
      response.should render_template :new
    end
  end

  describe "POST 'create'" do
    it "redirects to :show action" do
      post 'create', class_offer: FactoryGirl.attributes_for(:class_offer)
      response.should redirect_to admin_class_offer_url(ClassOffer.last)
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit', id: create(:class_offer)
      response.should render_template :edit
    end
  end

  describe "PATCH 'update'" do
    before :each do
      @class_offer = create :class_offer
    end
    it "redirects to :show action" do
      patch 'update', id: @class_offer, class_offer: @class_offer.attributes
      response.should redirect_to admin_class_offer_url(@class_offer)
    end
  end

  describe "DELETE 'destroy'" do
    it "redirects to :index" do
      delete 'destroy', id: create(:class_offer)
      response.should redirect_to admin_class_offers_url
    end
  end

  describe "Permit params for :create action" do
    arr = [ :summary, :start_date, :end_date, :non_member_cost, :standard_member_cost, :premier_member_cost, :teacher, :teacher_profile, :requirements, :time, :learning_points, :name, :status, :link, :avatar, :crop_x, :crop_y, :crop_w, :crop_h ]
    arr.each do |k|
      it {should permit(k).for(:create)}
    end
  end

  describe "Permit params for :update action" do
    before :each do
      @class_offer = create :class_offer
    end
    arr = [ :summary, :start_date, :end_date, :non_member_cost, :standard_member_cost, :premier_member_cost, :teacher, :teacher_profile, :requirements, :time, :learning_points, :name, :status, :link, :avatar, :crop_x, :crop_y, :crop_w, :crop_h ]
    arr.each do |k|
      it {should permit(k).for(:update, params: { id: ClassOffer.first.id, class_offer: @class_offer.attributes })}
    end
  end

end
