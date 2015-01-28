class ForecastsController < ApplicationController
  def location

    # Set up the requirements
    require "rubygems"
    require 'open-uri'
    require 'json'
    

    # Intitalize the APIs
    google_map_url_base = "http://maps.googleapis.com/maps/api/geocode/json?address="
    weather_url_base = "https://api.forecast.io/forecast/78643f23c3b4cfef8751ca440c3c3ab7/"

    # Get the URL
    the_url = request.original_url    

    # Get the URL
    the_url = request.original_url    

    # Remove a portion of the string
    my_url = the_url[30..-1]

    # set up the gmap URL 
    google_map_url = google_map_url_base + my_url    
    raw_data = open(google_map_url).read
    parsed_data = JSON.parse(raw_data)
    
    # get specific hash results
    latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]
    country_name = parsed_data["results"][0]["address_components"][5]["long_name"]
    

    # Set up the weather api URL
    weather_api_url = weather_url_base + latitude.to_s + ',' + longitude.to_s    
    raw_data = open(weather_api_url).read
    parsed_data = JSON.parse(raw_data)
        
        
        
    #bring in the variables    
    @lat = latitude
    @long = longitude  
    @country = country_name  
    @street_address = my_url.tr!('+', ' ')
    @my_weather = parsed_data["hourly"]["summary"]
    @my_temp = parsed_data["hourly"]["data"][0]["temperature"].to_s
    @my_weather_icon = parsed_data["hourly"]["icon"]
    
    
    
    
    
  end

  def location_search

    # Set up the requirements
    require "rubygems"
    require 'open-uri'
    require 'json'
    

    # Intitalize the APIs
    google_map_url_base = "http://maps.googleapis.com/maps/api/geocode/json?address="
    weather_url_base = "https://api.forecast.io/forecast/78643f23c3b4cfef8751ca440c3c3ab7/"

    # Get the URL
    the_url = request.original_url    

    # Get the URL
    the_url = request.original_url    

    # Remove a portion of the string
    my_url = the_url[39..-1]

    # set up the gmap URL 
    google_map_url = google_map_url_base + my_url    
    raw_data = open(google_map_url).read
    parsed_data = JSON.parse(raw_data)
    
    # get specific hash results
    latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]
    

    # Set up the weather api URL
    weather_api_url = weather_url_base + latitude.to_s + ',' + longitude.to_s    
    raw_data = open(weather_api_url).read
    parsed_data = JSON.parse(raw_data)
        
        
        
    #bring in the variables    
    @lat = latitude
    @long = longitude  
    @street_address = my_url.tr!('+', ' ')
    @my_weather = parsed_data["hourly"]["summary"]
    @my_temp = parsed_data["hourly"]["data"][0]["temperature"].to_s
    @my_weather_icon = parsed_data["hourly"]["icon"]
    
    
    render 'location'
    
    
    
  end



end
