class ClassOffersController < ApplicationController
  def index
    @class_offers = ClassOffer.active.order('start_date ASC')
  end

  def show
    @class_offer = ClassOffer.find params[:id]
  end
end
