class Location < ApplicationRecord
    has_many :travels
    has_many :users, through: :travels

    accepts_nested_attributes_for :travels, :users
    validates :name, presence: true
    validates :address, presence: true
end
