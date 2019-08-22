# CTA Tracker

## What is it?
CTA Tracker is a CLI Application that lets the user search for any train or bus station in Chicago and provides up to five arrival times at that station. It also lets the user save their favorite stations for ease of access.

## How to use it
The user first logs in by entering their username. If the user is entering a username for the first time, it will create a new username and add it to the database. This username should have atleast 3 alphanumerical characters. CTA Tracker allows the user to change their username if they wish to do so. The user will then be taken to the main menu. From here, the user can either look at their favorite stations or they can search for any station by name or id. The user can then save or remove that station from their favorites.
CTA Tracker provides an easy navigation flow for the user through its use of commands.

## List of commands
Below are the commands you can type into the console while using CTA Tracker. They can be used at any time to navigate throughout the application.

### main menu
Takes the user to the main menu.

### favorites
Shows the user their favorite stations.

### search
Asks the user whether they would like to search by ID or name.

### id
Prompts the user to enter the ID of the station they want to look up.

### name
Asks the user whether they are searching for a train or bus, then prompts the user based on the input.

### train
Prompts the user for the name of the train station.

### bus
Prompts the user for the name of the bus station.

### save
Saves the current station to the user's favorites.

### remove
Removes the current station from the user's favorites.

### (ID number)
A user can input a valid ID number to directly search for that station. 

### change username
Prompts the user to input a new username that they want to change their current one to. 

### quit
Exits the program.

## Credits
Anais Ahmed and Jason Le created this program as their first project at Flatiron School's immersive Software Engineering class in Austin. 
Credits to Chicago Transit Authority for their API and GTFS data, without which this program would not function. 
Credits also to Connor De La Cruz for the text-based Chicago skyline image. 