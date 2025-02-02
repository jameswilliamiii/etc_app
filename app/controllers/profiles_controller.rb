class ProfilesController < ApplicationController
  before_action :set_profile_instance_var, except: [ :index, :new, :create ]
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :user_owns_profile?, except: [ :index, :show, :new, :create ]
  before_action :profile_is_public?, only: [ :show ]

  def index
    if user_signed_in?
      @profiles = Profile.filter(params).page params[:page]
    else
      @profiles = Profile.filter(params).only_public.page params[:page]
    end
    unless @profiles.present?
      ids = Profile.pluck(:id)
      @random_profiles = Profile.find(ids.sample(2))
    end
  end

  def show

  end

  def new
    if current_user.profiles.present?
      redirect_to profile_url(current_user.profile), alert: "You can only create 1 profile."
    else
      @profile = Profile.new
      @profile.name = current_user.name
      @profile.email = current_user.email
    end
  end

  def create
    @profile = Profile.new profile_params
    @profile.user_id = current_user.id
    if @profile.save
      flash[:notice] = "Profile successfully created"
      crop_avatar?
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @profile.update_attributes profile_params
      flash[:notice] = "Profile successfully updated"
      crop_avatar?
    else
      render 'edit'
    end
  end

  def crop

  end

  def destroy
    @profile.destroy
    redirect_to profiles_url, notice: "Profile successfully deleted"
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :company, :public, :details, :twitter, :facebook, :linkedin, :github, :website, :email, :profile_type, :user_id, :skill_list, :avatar, :crop_x, :crop_y, :crop_w, :crop_h)
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

  def crop_avatar?
    if params[:profile][:avatar].present?
      render 'crop'
    else
      redirect_to @profile
    end
  end

  def profile_is_public?
    unless user_signed_in? || @profile.is_public?
      redirect_to profiles_url, alert: "Sorry, the profile you are trying to view is private, and can only be seen by ETC members."
    end
  end
end
