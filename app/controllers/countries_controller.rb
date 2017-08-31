class CountriesController < ApplicationController

  def show
    @country = Country.find_by(id: params[:id])
  end
end
