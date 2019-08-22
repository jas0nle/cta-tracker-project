require 'rest-client'
require 'json'
require 'pry'
require_relative "../app/models/user.rb"
require_relative "../app/models/station.rb"
require_relative "../config/environment.rb"
require_relative "../lib/command_line_interface.rb"

def station_page(id)
    station = Station.find_by(stop_id: id)
    puts "Come on, grow up a little." if id == "42069"
    puts "Nice try, kid." if id == "69420"
    puts "Not today, Satan." if id == "666"
    if station == nil
        begin
          raise ArgumentError
        rescue ArgumentError => error
            puts "The ID you have entered does not match a station. Maybe you typed it wrong? Try typing it again."
        end
    else
      puts station.name
      parsed = {}
      response = ""
      if station.modality == "train"
        if id.to_i.between?(30000, 40000)
          response = RestClient.get('http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=4067bc98976d47eb9013e6fdfb6703f6&stpid=' + id.to_s + '&max=5&outputType=JSON')
          parsed = JSON.parse(response)
          parsed["ctatt"]["eta"].each {|pred| puts "#{pred["rt"]} Line - #{pred["stpDe"]} - arriving at #{pred["arrT"].split("T")[1]}"}
        else
          response = RestClient.get('http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=4067bc98976d47eb9013e6fdfb6703f6&mapid=' + id.to_s + '&max=5&outputType=JSON')
          parsed = JSON.parse(response)
          parsed["ctatt"]["eta"].each {|pred| puts "#{pred["rt"]} Line - #{pred["stpDe"]} - arriving at #{pred["arrT"].split("T")[1]}"}
        end
      else
          response = RestClient.get('http://www.ctabustracker.com/bustime/api/v3/getpredictions?key=m7uRZbMPEpTMGTnkF5nXYXKbD&stpid=' + id.to_s + '&top=5&format=json')
          parsed = JSON.parse(response)
          parsed["bustime-response"]["prd"].each {|pred| puts "#{pred["rt"]} #{pred["rtdir"]} to #{pred["des"]} - arriving at #{pred["prdtm"].split(" ")[1]}"}
      end
    puts "Wheelchair boarding is " + (station.wheelchair_boarding == "1" ? "" : "not ") + "possible at this station."
    station
    end
end
