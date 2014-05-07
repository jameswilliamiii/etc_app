class ErrorsController < ApplicationController
  def error_404
    @not_found_path = params[:not_found]
    respond_to do |format|
      format.html { render :error_404 }
      format.all { redirect_to controller: 'errors', action: 'error_404' }
    end
  end

  def error_500
  end
end
