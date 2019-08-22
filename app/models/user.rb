class User < ActiveRecord::Base
    has_and_belongs_to_many :stations

    def add_to_favorites(station)
        if !self.stations.include?(station)
            self.stations.push(station)
            puts "You have added this station to your favorites"
        else
            puts "You have already saved this station"
        end
    end
    
    def remove_from_favorites(station)
        if self.stations.include?(station)
            self.stations.delete(station)
            puts "You have removed this station from your favorites"
        else
            puts "This station is not saved to your favorites"
        end
    end
end