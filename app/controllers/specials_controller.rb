class SpecialsController < ApplicationController

  def show
    @name = params[:campaign]
  end

  def email
    @name = params[:name]
    @email = params[:email]
    @phone = params[:phone]
  end

end