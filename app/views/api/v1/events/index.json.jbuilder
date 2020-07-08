json.events do
  json.array! @events,
                :id,
                :title,
                :catch,
                :connpass_event_url,
                :hash_tag,
                :started_at,
                :ended_at,
                :limit,
                :accepted,
                :waiting,
                :applicant,
                :tags
end
json.total_count @events.total_count
