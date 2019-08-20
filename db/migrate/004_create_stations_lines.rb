class CreateStationsLines < ActiveRecord::Migration[5.2]
    def change
        create_table :stations_lines do |s|
            s.integer :station_id
            s.integer :line_id
        end
    end
end