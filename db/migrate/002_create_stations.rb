class CreateStations < ActiveRecord::Migration[5.2]
    def change
        create_table :stations do |s|
            s.string :name
            s.string :description
            s.float :latitude
            s.float :longitude
            s.boolean :wheelchair_boarding
        end
    end
end