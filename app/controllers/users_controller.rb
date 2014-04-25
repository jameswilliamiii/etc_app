class UsersController < ApplicationController
  def show
    @user = current_user
    @profile = @user.profile if @user.has_profile?
  end
end
