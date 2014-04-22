class ProfilesController < ApplicationController
  before_action :set_profile_instance_var, except: [ :index, :new, :create ]

  def index
  end

  def show

  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new profile_params
    if @profile.save
      redirect_to @profile, notice: "Profile successfully created"
    else
      render 'new'
    end
  end

  def edit

  end

  def update
  end

  def destroy
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :company, :public, :details, :twitter, :facebook, :linkedin, :github, :website, :email)
  end

  def set_profile_instance_var
    @profile = Profile.find params[:id]
  end
end
