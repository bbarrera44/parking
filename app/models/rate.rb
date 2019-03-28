class Rate < ApplicationRecord
  has_many :entry

  validates :name, :value, presence: true


end
