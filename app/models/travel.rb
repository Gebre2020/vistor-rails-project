class Travel < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :location, optional: true
    validates :name, presence: true
    validates :address, presence: true
    # accepts_nested_attributes_for :locations

    # scope methods 
    # class methods that query the table associated with model return 

    # return the last 3 travels that were made
    scope :latest_travels, -> {order(created_at: :desc).limit(3)}

end
