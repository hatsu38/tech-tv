json.set! :event do
  json.merge! @event.attributes
end
json.tags do
  json.array! @tags do |tag|
    json.id tag.id
    json.name  tag.name
    json.events tag.events.published_popular_select_tags_with_movies_tags.limit(@events_num), partial: 'api/v1/commons/event', as: :event
  end
end
json.movies do
  json.array! @movies do |movie|
    json.id tag.id
    json.url  tag.url
  end
end