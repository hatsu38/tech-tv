json.tags do
  json.array! @tags do |tag|
    json.id tag.id
    json.name  tag.name
    json.event_count tag.events.size
  end
end

json.total_count @tags.total_count
