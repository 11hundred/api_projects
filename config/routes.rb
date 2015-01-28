Rails.application.routes.draw do
  
  
  get("/", { :controller => "pages", :action => "home" })
  get("/weather/", { :controller => "forecasts", :action => "location" })
  get("/weather/:address", { :controller => "forecasts", :action => "location" })
  
  
end
