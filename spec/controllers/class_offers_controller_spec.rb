require 'spec_helper'

describe ClassOffersController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
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

end
