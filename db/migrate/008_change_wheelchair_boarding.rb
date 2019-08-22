class ChangeWheelchairBoarding < ActiveRecord::Migration[5.2]
    def change
        change_column :stations, :wheelchair_boarding, :string
    end
end
