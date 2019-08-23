require_relative 'spec_helper'

describe "Station" do

    it "can provide the modality of the station" do
        damon = Station.create(stop_id: 25000, name: "Damon")
        irving = Station.create(stop_id: 70, name: "Irving")

        expect(damon.modality).to eq("train")
        expect(irving.modality).to eq("bus")
    end
end