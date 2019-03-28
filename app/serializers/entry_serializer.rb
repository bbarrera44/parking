class EntrySerializer < ActiveModel::Serializer
  attributes :id, :entry_time, :exit_time, :total_time, :price, :vehicle_id, :rate, :parking_id
end
