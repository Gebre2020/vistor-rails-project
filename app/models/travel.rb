class Travel < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :location, optional: true
    validates :name, presence: true
    validates :address, presence: true
   # accepts_nested_attributes_for :locations
end
