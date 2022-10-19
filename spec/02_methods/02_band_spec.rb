describe Band do
  let(:la_band) { Band.first }
  let(:ny_band) { Band.second }

  before do
    la_venue = Venue.create(title: "la_venue", city: "LA")
    ny_venue = Venue.create(title: "ny_venue", city: "NY")
    la_band = Band.create(name: "LA band", hometown: "LA")
    ny_band = Band.create(name: "NY band", hometown: "NY")
    Concert.create(band: la_band, venue: la_venue, date: "10/26/21")
    Concert.create(band: ny_band, venue: la_venue, date: "10/26/21")
    Concert.create(band: la_band, venue: ny_venue, date: "10/27/21")
  end

  describe ".most_performances" do
    it "returns the `Band` instance for the band that has played the most concerts" do
      expect(Band.most_performances).to eq(la_band)
    end
  end

  describe "#play_in_venue" do
    it "creates a new concert for the band in that venue on that date" do
      expect { la_band.play_in_venue(Venue.first, "10/28/21") }.to change(la_band.concerts, :count).by(1)
    end
  end

  describe "#all_introductions" do
    it "returns an array of strings representing all the introductions for this band" do
      expect(la_band.all_introductions).to eq(
        [
          "Hello LA!!!!! We are LA band and we're from LA",
          "Hello NY!!!!! We are LA band and we're from LA"
        ]
      )
    end
  end
end
