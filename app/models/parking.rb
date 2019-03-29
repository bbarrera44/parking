class Parking < ApplicationRecord
  has_many :vehicle
  has_many :entry


  validates :name, :adress, :phone, presence: true
  # def total_vehicles_facture
  #   entry.where("exit_time is null")
  # end
  # def total_vehicle
  #   entry.where("exit_time is not null")
  # end


end
