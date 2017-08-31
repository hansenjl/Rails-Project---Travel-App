class VisitsController < ApplicationController

  def new
    @cities = City.all
    @countries = Country.all
  end
end
