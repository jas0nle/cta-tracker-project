class CreateLines < ActiveRecord::Migration[5.2]
    def change
        create_table :lines do |t|
            t.string :long_name
            t.string :short_name
            t.integer :type
        end
    end
end