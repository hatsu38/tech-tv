class Batch::SaveEventTagDiffDaysJob < ApplicationJob
  queue_as :default
  def perfrom(today: Date.today, from_day: 1.days)
    events = Event.where(created_at: [from_day..today]).where(updated_at: [from_day..today])
    return if events.blank?

    Tag.find_each do |tag|
      serched_event_ids = events.serch_by_keyword(tag.name).pluck(:id)
      serched_event_ids.each do |serched_event_id|
        begin
          EventTag.find_or_create_by(tag_id: tag.id, event_id: serched_event_id)
        rescue => exception
          Rails.logger.error(exception.message)
          Raven.capture_exception(exception) if Rails.env.production?
        end
      end
    end
  end
end