describe Venue do
  let(:la_venue) { Venue.first }
  let(:ny_venue) { Venue.second }
  let(:la_band) { Band.first }
  let(:ny_band) { Band.second }
  
  before do
    la_venue = Venue.create(title: "la_venue", city: "LA")
    ny_venue = Venue.create(title: "ny_venue", city: "NY")
    la_band = Band.create(name: "LA band", hometown: "LA")
    ny_band = Band.create(name: "NY band", hometown: "NY")
    Concert.create(band: la_band, venue: la_venue, date: "10/25/21")
    Concert.create(band: la_band, venue: la_venue, date: "10/26/21")
    Concert.create(band: ny_band, venue: la_venue, date: "10/26/21")
    Concert.create(band: la_band, venue: ny_venue, date: "10/27/21")
  end

  describe "#concert_on" do
    it "finds and returns the first concert on that date at that venue" do
      expect(la_venue.concert_on("10/26/21")).to eq(Concert.second)
    end
  end

  describe "#most_frequent_band" do
    it "returns the band with the most concerts at the venue" do
      expect(la_venue.most_frequent_band).to eq(la_band)
    end
  end
end
