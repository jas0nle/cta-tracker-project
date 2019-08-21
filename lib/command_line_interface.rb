require_relative "../app/models/user.rb"
require_relative "../app/models/line.rb"
require_relative "../app/models/station.rb"
require_relative "../config/environment.rb"

def welcome
    puts "               ╷ ╷                    "
    puts "               │ │                    "
    puts "               ║ ║                    "
    puts "               ║ ║                    "
    puts "              ▐███▌                   "
    puts "              ▐███▌           │   │   "
    puts "              ▐███▌           ╽   ╽   "
    puts "             ▐█████▌          ┃   ┃   "
    puts "             ▐█████▌          █████   "
    puts "     ▄██▄    ▐█████▌          █████   "
    puts "     ████   ▐███████▌         █████   "
    puts "     ████   ▐███████▌        ▐█████▌  "
    puts "   ▐██████▌ ▐███████▌        ▐█████▌  "
    puts "   ▐██████▌ ▐███████▌ ▗▄▄▄▄▖ ▐█████▌  "
    puts "   ▐██████▌ ▐███████▌ ▐████▌ ███████  "
    puts "█████▌████▌ ▐███████▌ ▐████▌ ████▐████"
    puts "█████▌████▌ ▐███████▌ ▐████▌ ████▐████"
    puts "██████████████████████████████████████"
    puts "██████████████████████████████████████"
    puts "(credits to Connor de la Cruz for the skyline) \n \n \n"
    puts "Welcome to CTA Tracker!"
end

def get_username
    puts "We provide a search function for all of Chicago's train stations and bus stops. We also keep track of your favorite stations!"
    puts "Please enter your username to get started:"
    user_name = gets.chomp
    User.find_or_create_by(username: user_name)
end

def greet_user(username)
    puts "Hello, #{username}!"
end

def main_menu
    puts "Please select one of the options below:"
    puts "1. See your saved stations"
    puts "2. Search for a station"
    puts "3. Back"
    puts "4. Quit"
    gets.chomp
end

def get_saved_list(user)
    puts "Here are your saved stations:"
    user.stations.each_with_index do |s, i|
        puts "#{i + 1}. #{s}"
    end
    puts "Please select a station, or select an option below:"
    puts "a. Back"
    puts "b. Quit"
    gets.chomp
end

def search_id_or_name
    puts "Would you like to search by:"
    puts "1. ID"
    puts "2. Name"
    gets.chomp
end

def search_id
    puts "Enter the ID of the station. This ID is visible on the placard of the bus stop."
    id = gets.chomp
end

def train_or_bus
    puts "Are you looking for a train station or bus stop?"
    puts "1. Train"
    puts "2. Bus"
    gets.chomp
end

def search_by_name(modality)
    puts "Please enter the name of your station:"
    name = gets.chomp
    name_array = name.split(/\W/)
    allstations = []
    if modality == "1"
        allstations = Station.all.select {|station| station.modality == "train" && station.stop_id.to_i > 40000}
        name_array.each do |name_part|
            allstations.delete_if {|station| !(/#{name_part}/i.match(station.name))}
        end
    else
        allstations = Station.all.select {|station| station.modality == "bus"}
        name_array.each do |name_part|
            allstations.delete_if {|station| !(/#{name_part}/i.match(station.description))}
        end
    end
    puts allstations[0]

    first_five_stations = allstations.first(5)
    if first_five_stations.first.modality == "train"
        first_five_stations.each {|station| puts "#{station.stop_id}. #{station.name}"}
    else
        first_five_stations.each {|station| puts "#{station.stop_id}. #{station.name} - #{station.description}"}
    end

        
end
