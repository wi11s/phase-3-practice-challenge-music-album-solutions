class Band < ActiveRecord::Base
    has_many :concerts
    has_many :venues, through: :concerts

    def play_in_venue(venue, date)
        Concert.create(date: date, venue_id: venue.id, band_id: id)
    end

    def all_introductions
        introductions = []
        
        venues.map do |venue|
            introductions << "Hello #{venue.city}!!!!! We are #{name} and we're from #{hometown}"
        end

        introductions
    end

    def self.most_performances
        self.find(Concert.group(:band_id).order('COUNT(band_id) DESC').limit(1).first.band_id)
    end
end