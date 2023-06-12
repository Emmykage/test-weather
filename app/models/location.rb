class Location < ApplicationRecord
    def fetch_codinate
        cord = HTTParty.get("http://api.openweathermap.org/geo/1.0/direct?q=#{self.name}&limit=5&appid=f435876fedf024ce1d92b2961c1ce412")
        res = JSON.parse(cord.body)[0]

    end

    def lat
        fetch_codinate["lat"]
    end

    def lon
       fetch_codinate["lon"]

    end

    def fetchdata
      # cord = HTTParty.get("http://api.openweathermap.org/geo/1.0/direct?q=#{self.name}&limit=5&appid=f435876fedf024ce1d92b2961c1ce412")
      # res = JSON.parse(cord.body)[0]
      # lat = res["lat"]
      # lon = res["lon"]
      response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&appid=f435876fedf024ce1d92b2961c1ce412")
      info =  JSON.parse(response.body)

    end
      
      

    def temp
       
        temp = fetchdata['main']['temp']
    end
    def hum
       
        hum = fetchdata['main']['humidity']
    end 
    def wind
      
        wind = fetchdata['wind']['speed']
    end
    def description
        description = fetchdata['weather'][0]['description']
    end
  
    
end
