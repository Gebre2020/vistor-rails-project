class User < ApplicationRecord
  has_secure_password
  has_many :travels
  has_many :locations, through: :travels
  
  validates :username, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, length: { in: 6..10 }
  #accepts_nested_attributes_for :locations
  validate :is_email?

  # custom method 

  def is_email?
    if !email.match(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
      errors.add(:email, "Give me a real email dammit")
    end 
  end 

end
