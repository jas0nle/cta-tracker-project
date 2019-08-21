require_relative "../config/environment.rb"
require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
require_relative "../app/models/user.rb"
require_relative "../app/models/line.rb"
require_relative "../app/models/station.rb"

welcome
user = get_username
greet_user(user.username)

menu_input = main_menu
case menu_input
when "1"
    get_saved_list(user)
when "2"
    #search_id_or_name
when "3"
    #back
when "4"
    #quit
else
    puts "Please enter a valid command"
    main_menu
end