class AdminUsersController < ApplicationController
  before_action :assign_profile_instance_var, except: [ :index ]
  before_action :authenticate_admin!

  def index
    @users = User.page params[:page]
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  def invite_user

  end

  private

  def assign_profile_instance_var
    @profile = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:admin, :first_name, :last_name, :email, :member_since, :membership_type, :email)
  end
end