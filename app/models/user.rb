class User < ApplicationRecord
  has_secure_password
  has_many :travels
  has_many :locations, through: :travels
  
  validates :username, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  accepts_nested_attributes_for :locations
end
