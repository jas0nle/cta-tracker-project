class CreateUsersStations < ActiveRecord::Migration[5.2]
    def change
        create_table :users_stations do |u|
            u.integer :user_id
            u.integer :station_id
        end
    end
end