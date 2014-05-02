class UsersController < ApplicationController
  before_action
  before_action :authenticate_user!

  def show
    @user = current_user
    @profile = @user.profile if @user.has_profile?
  end
end
