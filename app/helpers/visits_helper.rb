module VisitsHelper

  def new
    @countries = Country.all
  end
end
