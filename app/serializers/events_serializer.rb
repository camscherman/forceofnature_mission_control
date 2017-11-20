class EventsSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start_time
end
