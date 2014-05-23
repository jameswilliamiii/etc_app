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

end
