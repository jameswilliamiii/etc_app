require 'spec_helper'

describe Admin::UsersController do

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
      get 'show', id: create(:user)
      response.should render_template :show
    end
  end

  describe "GET 'edit'" do
    it "renders :edit template" do
      get 'edit', id: create(:user)
      response.should render_template :edit
    end
  end

  describe "PATCH 'update'" do
    before :each do
      @user = create :user
    end
    it "redirects to :show action" do
      patch 'update', id: @user, user: @user.attributes
      response.should redirect_to admin_user_url @user
    end
  end

  describe "delete 'destroy'" do
    it "redirects to :index action" do
      delete 'destroy', id: create(:user)
      response.should redirect_to admin_users_url
    end
  end

  describe "POST 'invite_user'" do
    before :each do
      @user = create :user
    end
    it "redirects to :show action" do
      post 'invite_user', user_id: @user
      response.should redirect_to admin_user_url @user
    end
  end

end