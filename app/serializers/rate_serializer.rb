class RateSerializer < ActiveModel::Serializer
  attributes :id, :name, :value, :date_begin, :date_end
end
