class Vehicle < ApplicationRecord
  has_many :entry
  belongs_to :parking



end
