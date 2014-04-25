class Admin::UsersController < ApplicationController
  before_action :assign_user_instance_var, except: [ :index, :invite_user ]
  before_action :authenticate_admin!

  def index
    @users = User.page params[:page]
  end

  def show

  end

  def edit

  end

  def update
    if @user.update_attributes user_params
      redirect_to @profile, notice: "#{@user.name} was updated successfully"
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_url, notice: "#{@user.name} was successfully deleted"
  end

  def invite_user
    @user = User.find params[:user_id]
    @user.invite!(current_user)
    redirect_to admin_user_url(@user), notice: "#{@user.name} was sent an invitation to join"
  end

  private

  def assign_user_instance_var
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:admin, :first_name, :last_name, :email, :member_since, :membership_type, :email)
  end
end