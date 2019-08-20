require_relative "../config/environment.rb"
require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
require_relative "../app/models/user.rb"
require_relative "../app/models/line.rb"
require_relative "../app/models/station.rb"

welcome
name_input = get_username
new_user = User.find_or_create_by(username: name_input)
greet_user(name_input)