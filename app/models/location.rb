class Location < ApplicationRecord
    has_many :travels
    has_many :users, through: :travels
    
    validates :city, :country, presence: true
    accepts_nested_attributes_for :travels
    
    # scope method that locations travels by their location
    
    # write a scope method as class method
    
    def self.locs_travels
        joins(:travels).group('locations.city')
    end

    # scope method
    # scope :locs_travels, -> {joins(:travels).group('locations.city')}

    #alphabetize the list of locations
    scope :alpha, -> {'city'}

    # show locations with travels more than 2 
    scope :baller_travels, -> {joins(:travels).where('travels.name > 2').group('locations.city')}
end
