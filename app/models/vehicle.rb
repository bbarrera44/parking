class Vehicle < ApplicationRecord
  has_many :entry
  belongs_to :parking

  validates :plate, :color, :brand, presence: true



end
