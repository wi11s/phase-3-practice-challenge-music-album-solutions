describe Concert do
  let(:concert) { Concert.first }

  before do
    la_venue = Venue.create(title: "la_venue", city: "LA")
    la_band = Band.create(name: "LA band", hometown: "LA")
    Concert.create(band: la_band, venue: la_venue, date: "10/26/21")
  end

  it "has a date" do
    expect(concert).to have_attributes(date: "10/26/21")
  end

  describe "#band" do
    it "returns the Band instance for this Concert" do
      expect(concert.band).to eq(Band.first)
    end
  end

  describe "#venue" do
    it "returns the Venue instance for this Concert" do
      expect(concert.venue).to eq(Venue.first)
    end
  end
end