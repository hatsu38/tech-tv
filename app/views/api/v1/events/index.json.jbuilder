json.events do
  json.partial! 'api/v1/commons/event', collection: @events, as: :event
end
json.total_count @events.total_count
