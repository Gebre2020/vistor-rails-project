class Location < ApplicationRecord
    has_many :travels
    has_many :users, through: :travels
    
    validates :city, :country, presence: true
    accepts_nested_attributes_for :travels
    
end
