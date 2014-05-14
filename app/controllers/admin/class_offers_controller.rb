class Admin::ClassOffersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :set_class_offer_instance_var, except: [ :index, :new, :create ]

  def index
    @class_offers = ClassOffer.page params[:page]
  end

  def new
    @class_offer = ClassOffer.new
  end

  def create
    @class_offer = ClassOffer.new class_offer_params
    if @class_offer.save
      flash[:notice] = "Your new class has been successfully created"
      crop_avatar?
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @class_offer.update_attributes class_offer_params
      flash[:notice] = "Your class was successfully updated"
      crop_avatar?
    else
      render 'edit'
    end
  end

  def crop

  end

  def destroy
    @class_offer.destroy
    redirect_to admin_class_offers_url, notice: "You successfully deleted a class"
  end

  private

  def class_offer_params
    params.require(:class_offer).permit(:summary, :start_date, :end_date, :non_member_cost, :standard_member_cost, :premier_member_cost, :teacher, :teacher_profile, :requirements, :time, :learning_points, :name, :status, :link, :avatar, :crop_x, :crop_y, :crop_w, :crop_h)
  end

  def set_class_offer_instance_var
    @class_offer = ClassOffer.find params[:id]
  end

  def crop_avatar?
    if params[:class_offer][:avatar].present?
      render 'crop'
    else
      redirect_to admin_class_offer_url(@class_offer)
    end
  end
end
