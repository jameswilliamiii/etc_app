require 'spec_helper'

describe UsersController do

  before(:each) do
    @user = create :user
    sign_in @user
  end

  describe "GET 'show'" do
    it "renders :show template" do
      get 'show'
      response.should render_template :show
    end
  end

end
