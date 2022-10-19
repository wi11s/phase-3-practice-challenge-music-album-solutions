describe Band do
  let(:band) { Band.first }

  before do
    la_venue = Venue.create(title: "la_venue", city: "LA")
    la_band = Band.create(name: "LA band", hometown: "LA")
    Concert.create(band: la_band, venue: la_venue, date: "10/26/21")
  end

  it "has a name and a hometown" do
    expect(band).to have_attributes(name: "LA band", hometown: "LA")
  end

  describe "#concerts" do
    it "returns the Concert instances for this band" do
      expect(band.concerts).to include(Concert.first)
    end
  end

  describe "#venues" do
    it "returns the Venue instances for this band" do
      expect(band.venues).to include(Venue.first)
    end
  end
end