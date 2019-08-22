require 'rest-client'
require 'json'
require 'pry'
require_relative "../app/models/user.rb"
require_relative "../app/models/line.rb"
require_relative "../app/models/station.rb"
require_relative "../config/environment.rb"
require_relative "../lib/command_line_interface.rb"

def station_page(id)
    station = Station.find_by(stop_id: id)
    puts station.name
    parsed = {}
    response = ""
    if station.modality == "train"
        response = RestClient.get('http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=4067bc98976d47eb9013e6fdfb6703f6&mapid=' + id.to_s + '&max=5&outputType=JSON')
        parsed = JSON.parse(response)
        parsed["ctatt"]["eta"].each {|pred| puts "#{pred["rt"]} Line - #{pred["stpDe"]} - arriving at #{pred["arrT"].split("T")[1]}"}
    else
        response = RestClient.get('http://www.ctabustracker.com/bustime/api/v3/getpredictions?key=m7uRZbMPEpTMGTnkF5nXYXKbD&stpid=' + id.to_s + '&top=5&format=json')
        parsed = JSON.parse(response)
        parsed["bustime-response"]["prd"].each {|pred| puts "#{pred["rt"]} #{pred["rtdir"]} to #{pred["des"]} - arriving at #{pred["prdtm"].split(" ")[1]}"}
    end
    station
end
