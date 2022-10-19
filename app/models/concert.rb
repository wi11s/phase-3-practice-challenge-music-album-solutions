class Concert < ActiveRecord::Base
    belongs_to :band
    belongs_to :venue

    def hometown_show?
        band.hometown == venue.city
    end

    def introduction
        "Hello #{venue.city}!!!!! We are #{band.name} and we're from #{band.hometown}"
    end
end