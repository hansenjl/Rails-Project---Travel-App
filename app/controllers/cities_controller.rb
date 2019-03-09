class CitiesController < ApplicationController
  load_and_authorize_resource


  def show
    @comment = Comment.new
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @city}
    end
  end

  def new
    @city = City.new
    @countries = Country.all
  end

  def create
    @city = City.create(city_params)
    @countries = Country.all
    if @city.save
      redirect_to cities_path
    else
      render 'cities/new'
    end
  end

  def index
    @cities = City.all.includes(:country)
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @cities}
    end
  end

  def edit
  end

  def update
    @city.update(city_params)
    if @city.save
    redirect_to cities_path
    else
      render 'cities/edit'
    end
  end

  private

  def set_city
     @city = City.find_by(id: params[:id])
  end

  def city_params
    params.require(:city).permit(:name, :country_id,
      country_field:[:name])
  end
end
