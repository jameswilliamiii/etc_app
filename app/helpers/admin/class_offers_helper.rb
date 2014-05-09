module Admin::ClassOffersHelper
  def class_status(class_offer)
    class_offer.active? ? "success" : "alert"
  end
end
