class Batch::SaveEventTagJob < ApplicationJob
  queue_as :default
  def perform(args = {})
    Tag.find_each do |tag|
      serched_event_ids = Event.serch_by_keyword(tag.name).pluck(:id)
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