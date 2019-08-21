class Station < ActiveRecord::Base
    has_and_belongs_to_many :users
    def modality
        self.stop_id > 20000 ? "train" : "bus"
    end
end