class DropLines < ActiveRecord::Migration[5.2]
    def change
        drop_table :lines
        drop_table :stations_lines
    end
end