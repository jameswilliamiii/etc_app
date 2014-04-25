class ProfilesController < ApplicationController
  before_action :set_profile_instance_var, except: [ :index, :new, :create ]
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :user_owns_profile?, except: [ :index, :show, :new, :create ]

  def index
    @profiles = Profile.filter(params).page params[:page]
    unless @profiles.present?
      ids = Profile.pluck(:id)
      @random_profiles = Profile.find(ids.sample(2))
    end
  end

  def show

  end

  def new
    @profile = Profile.new
    @profile.name = current_user.name
    @profile.email = current_user.email
  end

  def create
    @profile = Profile.new profile_params
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to @profile, notice: "Profile successfully created"
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @profile.update_attributes profile_params
      redirect_to @profile, notice: "Profile sucessfully updated"
    else
      render 'edit'
    end
  end

  def destroy
    @profile.destroy
    redirect_to profiles_url, notice: "Profile successfully deleted"
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :company, :public, :details, :twitter, :facebook, :linkedin, :github, :website, :email, :profile_type, :user_id, :skill_list)
  end

  def set_profile_instance_var
    @profile = Profile.find params[:id]
  end

  def user_owns_profile?
    set_profile_instance_var
    unless current_user == @profile.user || current_user.is_admin?
      redirect_to profiles_url, alert: "You do not have access to that page"
    end
  end
end
