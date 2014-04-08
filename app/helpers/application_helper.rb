module ApplicationHelper
  def on_home_view?
    params[:action] == "home"
  end
end
