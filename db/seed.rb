require 'CSV'
require 'pry'
require_relative '../config/environment'

stops = CSV.read("db/stops.csv", headers: true)
routes = CSV.read("db/routes.csv", headers: true)
# usernames = CSV.read("db/usernames.csv", headers: true)
puts stops[0]["stop_id"].class
puts routes[0]["route_type"].class

# usernames.each do |user|
#     newuser = User.new
#     newuser.username = user["username"]
#     newuser.save
# end


# stops.each do |stop|
#     station = Station.new
#     station.stop_id = stop["stop_id"]
#     station.name = stop["stop_name"]
#     station.description = stop["stop_desc"]
#     station.latitude = stop["stop_lat"]
#     station.longitude = stop["stop_lon"]
#     station.wheelchair_boarding = (stop["wheelchair_boarding"] == 1)
#     station.save
# end

# routes.each do |route|
#     line = Line.new
#     line.short_name = route["route_short_name"]
#     line.long_name = route["route_long_name"]
#     line.modality = route["route_type"]
#     line.save
# end


