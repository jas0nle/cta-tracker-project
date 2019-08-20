class ChangeTypeToModality < ActiveRecord::Migration[5.2]
    def change
        rename_column :lines, :type, :modality
    end
end