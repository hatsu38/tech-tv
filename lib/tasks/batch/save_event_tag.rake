namespace :batch do
  # bundle exec rails batch:save_event_tag
  desc "イベント登録"
  task save_event_tag: :environment do
    tag_events = []
    Tag.find_each do |tag|
      serched_event_ids = Event.serch_by_keyword(tag.name).pluck(:id)
      serched_event_ids.each do |serched_event_id|
        EventTag.find_or_create_by(tag_id: tag.id, event_id: serched_event_id)
      end
    end
  end
end