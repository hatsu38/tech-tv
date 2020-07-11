json.tags do
  json.array! @tags do |tag|
    json.id tag.id
    json.name  tag.name
    json.events tag.events.popular.limit(10).select_columns
  end
end