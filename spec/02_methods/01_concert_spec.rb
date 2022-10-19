describe Concert do
  let(:concert1) { Concert.first }
  let(:concert2) { Concert.second }

  before do
    la_venue = Venue.create(title: "la_venue", city: "LA")
    la_band = Band.create(name: "LA band", hometown: "LA")
    ny_band = Band.create(name: "NY band", hometown: "NY")
    Concert.create(band: la_band, venue: la_venue, date: "10/26/21")
    Concert.create(band: ny_band, venue: la_venue, date: "10/26/21")
  end

  describe "#hometown_show?" do
    it "returns true if the concert is in the band's hometown" do
      expect(concert1.hometown_show?).to be(true)
    end

    it "returns false if the concert is not in the band's hometown" do
      expect(concert2.hometown_show?).to be(false)
    end
  end

  describe "#introduction" do
    it "returns a string with the band's introduction for this concert" do
      expect(concert1.introduction).to eq(
        "Hello LA!!!!! We are LA band and we're from LA"
      )
    end
  end
end
