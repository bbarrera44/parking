class Vehicle < ApplicationRecord
  has_many :entry
  belongs_to :parking

  validates :plate, presence: true



end
