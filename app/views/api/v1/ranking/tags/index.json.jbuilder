json.tags do
  json.array! @tags do |tag|
    json.id tag.id
    json.name  tag.name
    json.events tag.events.select_columns.popular.limit(@events_num)
  end
end