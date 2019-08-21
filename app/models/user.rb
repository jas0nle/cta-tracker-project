class User < ActiveRecord::Base
    has_many :stations, through: :users_stations
end