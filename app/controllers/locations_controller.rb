class LocationsController < ApplicationController
  before_action :set_location, only: %i[ show edit update destroy ]

  # GET /locations or /locations.json
  def index
    @locations = Location.all
  #   @cities = []
  #   @locations.each do |c| 
  #     cord = HTTParty.get("http://api.openweathermap.org/geo/1.0/direct?q=#{c.name}&limit=5&appid=f435876fedf024ce1d92b2961c1ce412")
  #     res = JSON.parse(cord.body)[0]
  #     lat = res["lat"]
  #     lon = res["lon"]
  #     response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&appid=f435876fedf024ce1d92b2961c1ce412")
  #     info =  JSON.parse(response.body)

  #     @cities.push({
  #     id: c.id,
  #     name: c.name,
  #     temp: info['main']['temp'],
  #     hum: info['main']['humidity'],
  #     wind: info['wind']['speed'],
  #     description: info['weather'][0]['description']

  #  })
    # response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?lat=9.0765&lon=7.3986&appid=f435876fedf024ce1d92b2961c1ce412")


    # end
    # puts @cities
  end

  # GET /locations/1 or /locations/1.json
  def show
    location = Location.find(params[:id])
    lat = location.lat
    lon = location.lon
    response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&appid=f435876fedf024ce1d92b2961c1ce412")
    @showDetails = JSON.parse(response.body)

   @lists = @showDetails['list']

    puts @showDetails

  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations or /locations.json
  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to location_url(@location), notice: "Location was successfully created." }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1 or /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to location_url(@location), notice: "Location was successfully updated." }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1 or /locations/1.json
  def destroy
    @location.destroy

    respond_to do |format|
      format.html { redirect_to locations_url, notice: "Location was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def location_params
      params.require(:location).permit(:name)
    end
end
