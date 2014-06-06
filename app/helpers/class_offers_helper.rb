module ClassOffersHelper
  def class_date_valid?(class_offer)
    class_offer.start_date < 1.day.ago
  end
end
