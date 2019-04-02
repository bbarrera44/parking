class Parking < ApplicationRecord
  has_many :vehicle
  has_many :entry


  validates :name, :adress, :phone, presence: true

end
