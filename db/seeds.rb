# This will delete any existing rows from the venues and bands tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting Venue/Band data..."
Venue.destroy_all
Band.destroy_all

puts "Creating Venues..."
la_venue = Venue.create(title: "The Roxy", city: "LA")
chi_venue = Venue.create(title: "Subterranean", city: "Chicago")
nyc_venue = Venue.create(title: "Terminal 5", city: "NYC")

puts "Creating Bands..."
ny_band = Band.create(name: "LCD Soundsystem", hometown: "NYC")
la_band = Band.create(name: "Muna", hometown: "LA")
chi_band = Band.create(name: "Noname", hometown: "Chicago")

puts "Creating Concerts..."
Concert.create(date: "9/3/22", band_id: 1, venue_id: 3)
Concert.create(date: "8/4/22", band_id: 2, venue_id: 2)
Concert.create(date: "8/4/22", band_id: 3, venue_id: 1)
Concert.create(date: "8/4/22", band_id: 1, venue_id: 1)

puts "Seeding done!"
