class User < ActiveRecord::Base
    has_many :stations

    #def self.find_user(input)
     #   self.find_or_create_by(username: input)
    #end
end