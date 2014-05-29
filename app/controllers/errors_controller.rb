class ErrorsController < ApplicationController
  def error_404
    @not_found_path = request.original_url
    respond_to do |format|
      format.html { render :error_404 }
      format.all { format.all  { render nothing: true, status: 404 } }
    end
  end

  def error_500
    respond_to do |format|
      format.html { render :error_500 }
      format.all { format.all  { render nothing: true, status: 500 } }
    end
  end
end
