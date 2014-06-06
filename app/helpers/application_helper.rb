module ApplicationHelper
  def on_home_view?
    params[:action] == "home"
  end

  def borders?
    "signed-in" if user_signed_in?
  end

  def class_schedule(class_offer)
    if class_offer.start_date == class_offer.end_date
      h "<li> #{class_offer.start_date.strftime('%D')}, #{class_offer.time} </li>".html_safe
    else
      h "<li> #{class_offer.start_date.strftime('%D')} through #{class_offer.end_date.strftime('%D')}, #{class_offer.time} </li>".html_safe
    end
  end
end
