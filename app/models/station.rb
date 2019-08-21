class Station < ActiveRecord::Base
    has_many :users, through: :users_stations
end