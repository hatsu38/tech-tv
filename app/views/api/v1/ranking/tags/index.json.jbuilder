json.tags do
  json.array! @tags do |tag|
    json.id tag.id
    json.name tag.name
    json.events tag.events.published_popular_select_tags_with_movies_tags.limit(@events_num), partial: "api/v1/commons/event", as: :event
  end
end
