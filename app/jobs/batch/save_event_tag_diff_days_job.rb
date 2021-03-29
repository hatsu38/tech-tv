class Batch::SaveEventTagDiffDaysJob < ApplicationJob
  queue_as :default
  def perform(today: Date.current, from_day: Date.current.yesterday)
    events = Event.where(created_at: [from_day..today]).where(updated_at: [from_day..today])
    return if events.blank?

    Tag.find_each do |tag|
      serched_event_ids = events.serch_by_keyword(tag.name).pluck(:id)
      serched_event_ids.each do |serched_event_id|
        EventTag.find_or_create_by(tag_id: tag.id, event_id: serched_event_id)
      rescue StandardError => e
        Rails.logger.error(e.message)
        Raven.capture_exception(e) if Rails.env.production?
      end
    end
  end
end
