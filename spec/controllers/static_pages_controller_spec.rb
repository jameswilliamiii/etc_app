require 'spec_helper'

describe StaticPagesController do

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'events'" do
    it "returns http success" do
      get 'events'
      response.should be_success
    end
  end

  describe "GET 'classes'" do
    it "returns http success" do
      get 'classes'
      response.should be_success
    end
  end

  describe "GET 'apply'" do
    it "returns http success" do
      get 'apply'
      response.should be_success
    end
  end

  describe "GET 'apply_confirmation'" do
    it "returns http success" do
      get 'apply_confirmation'
      response.should be_success
    end
  end

end
