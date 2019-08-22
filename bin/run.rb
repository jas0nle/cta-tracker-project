require_relative "../config/environment.rb"
require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
require_relative "../app/models/user.rb"
require_relative "../app/models/line.rb"
require_relative "../app/models/station.rb"

welcome
user = get_username
greet_user(user.username)
id = ""
input = "main menu"
last_input = []
station = ""
while input != "quit"
    case input
    when "main menu"
        main_menu
    when "favorites"
        get_saved_list(user)
    when "search"
        search_id_or_name
    when "id"
        id = search_id
        station = station_page(id)
    when "name"
        train_or_bus
    when "train"
        id = search_by_name("1")
        station = station_page(id)
    when "bus"
        id = search_by_name("2")
        station = station_page(id)
    when "save"
        user.add_to_favorites(station)
    when "remove"
        user.remove_from_favorites(station)
    end
    last_input << input
    input = gets.chomp.downcase
end
puts "Thank you for riding the CTA and for using our CTA tracker app."

# menu_input = main_menu
# case menu_input
# when "1"
#     get_saved_list(user)
# when "2"
#     id_or_name = search_id_or_name
#     if id_or_name == "1"
#         uwu = search_id
#     elsif id_or_name == "2"
#         owo = train_or_bus
#         if owo == "1"
#             #search only trains
#         elsif owo == "2"
#             #search only buses
#         end
#     else
#         "Please enter a valid command."
#     end
# when "3"
#     #back
# when "4"
#     #quit
# else
#     puts "Please enter a valid command."
#     main_menu
# end