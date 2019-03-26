class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :plate, :color, :brand, :parking_id
end
