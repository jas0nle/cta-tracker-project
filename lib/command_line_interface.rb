def welcome
    puts "Welcome to CTA Tracker!"
end

def get_username
    puts "We provide a search function for all of Chicago's train stations and bus stops. We also keep track of your favorite stations!"
    puts "Please enter your username to get started:"
    gets.chomp
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
