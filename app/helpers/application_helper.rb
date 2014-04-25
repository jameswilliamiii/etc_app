module ApplicationHelper
  def on_home_view?
    params[:action] == "home"
  end

  def borders?
    "signed-in" if user_signed_in?
  end
end
