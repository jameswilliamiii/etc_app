require 'spec_helper'

describe ProfilesController do

  before(:each) do
    @user = create :user
    sign_in @user
  end

  describe "GET 'index'" do
    it "renders :index template" do
      get 'index'
      response.should render_template :index
    end
  end

  describe "GET 'show'" do
    it "renders :show template" do
      get 'show', id: create(:profile, user: @user)
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
      post 'create', profile: FactoryGirl.attributes_for(:profile)
      response.should redirect_to Profile.last
    end
  end

  describe "GET 'edit'" do
    it "renders :edit template" do
      get 'edit', id: create(:profile, user: @user)
      response.should render_template :edit
    end
  end

  describe "PATCH 'update'" do
    before :each do
      @profile = create :profile, user: @user
    end
    it "redirects to :show action" do
      patch 'update', id: @profile, profile: @profile.attributes
      response.should redirect_to @profile
    end
  end

  describe "DELETE 'destroy'" do
    it "redirects to the :index action" do
      delete 'destroy', id: create(:profile, user: @user)
      response.should redirect_to profiles_url
    end
  end

end
