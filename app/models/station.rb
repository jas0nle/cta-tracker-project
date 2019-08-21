class Station < ActiveRecord::Base
    has_many :users
    def modality
        self.stop_id > 20000 ? "train" : "bus"
    end
end