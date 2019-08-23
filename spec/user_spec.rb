require_relative 'spec_helper'

describe "User" do

    it "has a username" do
        jason = User.create(username: "jason")

        expect(jason.username).to eq("jason")
    end

    it "has associated stations in an array" do
        jason = User.create(username: "jason")
        damon = Station.create(stop_id: 50, name: "Damon")

        jason.stations.push(damon)

        expect(jason.stations).to include(damon)
    end

    it "can add a station to favorites array" do
        jason = User.create(username: "jason")
        damon = Station.create(stop_id: 50, name: "Damon")

        jason.add_to_favorites(damon)

        expect(jason.stations).to include(damon)
    end

    it "can remove a station from its favorites array" do
        jason = User.create(username: "jason")
        irving = Station.create(stop_id: 70, name: "Irving")

        jason.add_to_favorites(irving)
        jason.remove_from_favorites(irving)

        expect(jason.stations).not_to include(irving)
    end

end