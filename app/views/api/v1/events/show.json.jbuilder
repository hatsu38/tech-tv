json.set! :event do
  json.merge! @event.attributes
end
json.tags do
  json.array! @tags do |tag|
    json.id tag.id
    json.name  tag.name
    json.events tag.events.popular.limit(@events_num).select_columns
  end
end
json.movies do
  json.array! @movies do |movie|
    json.id tag.id
    json.url  tag.url
  end
end