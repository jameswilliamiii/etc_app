class UsersController < ApplicationController
  def show
    @user = current_user
    @profile = @user.profiles.first
  end
end
