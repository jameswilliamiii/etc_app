class Admin::ClassOffersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :set_class_offer_instance_var, except: [ :index, :new, :create ]

  def index
    @class_offer = ClassOffer.active
  end

  def new
    @class_offer = ClassOffer.new
  end

  def create
    @class_offer = ClassOffer.new class_offer_params
    @faqs = params[class_offer][:faqs]
    if @class_offer.save
      create_faqs(@faqs, @class_offer)
      redirect_to admin_class_offers_url, notice: "Your new class was successfully created"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @class_offer.update_attributes class_offer_params
      redirect_to admin_class_offers_url, notice: "Your class was successfully updated"
    else
      render 'edit'
    end
  end

  def destroy
    @class_offer.destroy
    redirect_to admin_class_offers_url, notice: "You successfully deleted a class"
  end

  private

  def class_offer_params
    params.require(:class_offer).permit(:summary, :start_date, :end_date, :non_member_cost, :standard_member_cost, :premier_member_cost, :teacher, :teacher_profile, :requirements, :whats_included, :learning_points, faqs_attributes: [ :question, :answer ])
  end

  def set_class_offer_instance_var
    @class_offer = ClassOffer.find params[:id]
  end

  def create_faqs(faqs, class_offer)

  end
end
