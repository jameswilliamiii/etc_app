class UsersController < ApplicationController
  def show
    @user = current_user
    @profile = @user.profiles.first if @user.has_profile?
  end
end
