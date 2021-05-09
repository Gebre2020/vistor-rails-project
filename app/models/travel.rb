class Travel < ApplicationRecord
    belongs_to :user
    belongs_to :location
    validates :city, presence: true
    validates :country, presence: true
end
