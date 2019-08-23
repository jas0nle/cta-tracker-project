require_relative "../config/environment.rb"
require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
require_relative "../app/models/user.rb"
require_relative "../app/models/station.rb"

welcome
user = get_username
puts "\n"
greet_user(user.username)

id = ""
input = "main menu"
station = ""
while input != "quit"
    case input
    when ""
        main_menu
    when "change username"
        user = change_username
        greet_user(user.username)
        main_menu
    when "main menu"
        main_menu
    when "favorites"
        get_saved_list(user)
    when "search"
        search_id_or_name
    when "id"
        search_id
    when "name"
        train_or_bus
    when "train"
        search_by_name("1")
    when "bus"
        search_by_name("2")
    when /\d{1,5}/
        station = station_page(input)
        user.add_or_remove(station) unless !station
        menu_quit
    when "save"
        user.add_to_favorites(station)
        menu_quit
    when "remove"
        user.remove_from_favorites(station)
        menu_quit
    else
        valid_command
    end

    input = gets.chomp.downcase
    puts "\n"
end

puts "\nThank you for riding the CTA and for using our CTA tracker app. Have a great day!"
