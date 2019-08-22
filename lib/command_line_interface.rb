require_relative "../app/models/user.rb"
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
    puts "\n \n \n"
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
    puts "To see your saved stations, type 'favorites'."
    puts "To search for a station, type 'search'."
    puts "To go back to the main menu, type 'main menu'."
    puts "To quit, type 'quit'."
end

def get_saved_list(user)
    puts "Here are your saved stations:"
    user.stations.each do |s|
        if s.modality == "train"
          puts "#{s.stop_id}. #{s.name}"
        else
          puts "#{s.stop_id}. #{s.description}"
        end
    end
    puts "Please select a station by typing its ID, or use an option below:"
    puts "To search for a station, type 'search'."
    menu_quit
end

def search_id_or_name
    puts "To search by ID, type 'id'."
    puts "To search by name, type 'name'."
end

def search_id
    puts "Enter the ID of the station. This ID is visible on the placard of the bus stop."
end

def train_or_bus
    puts "To search for a train station, type 'train'."
    puts "To search for a bus stop, type 'bus'."
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

    first_five_stations = allstations.first(5)
    if first_five_stations.first.modality == "train"
        puts "Choose the ID of the station you want:"
        first_five_stations.each {|station| puts "#{station.stop_id}. #{station.name}"}
    else
        puts "Choose the ID of the station you want:"
        first_five_stations.each {|station| puts "#{station.stop_id}. #{station.name} - #{station.description}"}
    end
    

        
end

def valid_command
    puts "Please enter a valid command."
end

def menu_quit
    puts "To go back to the main menu, type 'main menu'."
    puts "To quit, type 'quit'."
end



