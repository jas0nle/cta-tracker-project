class User < ActiveRecord::Base
    has_and_belongs_to_many :stations

    ActiveRecord::Base.logger = nil

    def add_or_remove(station)
        puts self.stations.include?(station) ? "To remove this station from your favorites, type 'remove'." : "To add this station to your favourites, type 'save'."
    end

    def add_to_favorites(station)
        if !self.stations.include?(station)
            self.stations.push(station)
            puts "You have added this station to your favorites. To see your favorites, type 'favorites'."
        else
            puts "You have already saved this station. To see your favorites, type 'favorites'."
        end
    end
    
    def remove_from_favorites(station)
        if self.stations.include?(station)
            self.stations.delete(station)
            puts "You have removed this station from your favorites. To see your favorites, type 'favorites'."
        else
            puts "This station is not saved to your favorites. To see your favorites, type 'favorites'."
        end
    end
end