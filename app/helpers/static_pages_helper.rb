module StaticPagesHelper
  def is_premier?(params)
    unless params[:membership_type].present? && params[:membership_type] == "standard"
      "checked"
    end
  end
  def is_standard?(params)
    if params[:membership_type].present? && params[:membership_type] == "standard"
      "checked"
    end
  end
end
