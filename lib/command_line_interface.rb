def welcome
    puts "Welcome to CTA Tracker!"
end

def get_username
    puts "We provide a search function for all of Chicago's train stations and transit lines. We also keep track of your favorite stations!"
    puts "Please enter your username to get started:"
    gets.chomp
end

def greet_user(username)
    puts "Hello, #{username}!"
end