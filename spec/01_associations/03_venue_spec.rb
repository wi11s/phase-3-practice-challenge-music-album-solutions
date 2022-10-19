describe Venue do
  let(:venue) { Venue.first }

  before do
    la_venue = Venue.create(title: "la_venue", city: "LA")
    la_band = Band.create(name: "LA band", hometown: "LA")
    Concert.create(band: la_band, venue: la_venue, date: "10/26/21")
  end

  it "has a title and a city" do
    expect(venue).to have_attributes(title: "la_venue", city: "LA")
  end

  describe "#concerts" do
    it "returns the Concert instances for this Venue" do
      expect(venue.concerts).to include(Concert.first)
    end
  end

  describe "#bands" do
    it "returns the band instances for this Venue" do
      expect(venue.bands).to include(Band.first)
    end
  end
end