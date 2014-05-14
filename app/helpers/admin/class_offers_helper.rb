module Admin::ClassOffersHelper
  def class_status(class_offer)
    if class_offer.is_active?
      "success"
    elsif class_offer.is_closed?
      "secondary"
    else
      ""
    end
  end

  def dollar_sign?(cost)
    "$" unless cost == "FREE"
  end
end
