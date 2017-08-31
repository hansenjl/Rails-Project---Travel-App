class VisitsController < ApplicationController

  def new
    @countries = Country.all
  end
end
