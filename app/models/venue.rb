class Venue < ActiveRecord::Base
    has_many :concerts
    has_many :bands, through: :concerts

    def concert_on(date)
        concerts.find_by(date: date)
    end

    def most_frequent_band
        bands.find(concerts.group(:band_id).order('COUNT(band_id) DESC').limit(1).first.band_id)
    end
end