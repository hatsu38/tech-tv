namespace :batch do
  # bundle exec rails batch:save_event_tag
  desc "イベント登録"
  task save_event_tag: :environment do
    Tag.find_each do |tag|
      serched_event_ids = Event.serch_by_keyword(tag.name).pluck(:id)
      serched_event_ids.each do |serched_event_id|
        begin
          EventTag.find_or_create_by(tag_id: tag.id, event_id: serched_event_id)
        rescue => exception
          Rails.logger.error(exception.message)
          Raven.capture_exception(e)
        end
      end
    end
  end

  # bundle exec rails batch:save_event_tag_diff_days[1]
  desc "新着と新しい更新イベントのみ更新"
  task :save_event_tag_diff_days, ['diff_days'] => :environment do |tasks, args|
    today = Date.today
    from_day = today - args[:diff_days].to_i.days
    events = Event.where(created_at: [from_day..today]).where(updated_at: [from_day..today])
    next if events.blank?

    Tag.find_each do |tag|
      serched_event_ids = events.serch_by_keyword(tag.name).pluck(:id)
      serched_event_ids.each do |serched_event_id|
        begin
          EventTag.find_or_create_by(tag_id: tag.id, event_id: serched_event_id)
        rescue => exception
          Rails.logger.error(exception.message)
          Raven.capture_exception(e)
        end
      end
    end
  end
end