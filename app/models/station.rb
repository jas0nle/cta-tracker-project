class Station < ActiveRecord::Base
    has_and_belongs_to_many :users

    ActiveRecord::Base.logger = nil
    def modality
        self.stop_id.to_i > 20000 ? "train" : "bus"
    end
end