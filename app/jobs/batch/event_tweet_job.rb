class Batch::EventTweetJob < ApplicationJob
  queue_as :default

  def perform(from, to)
    events = Event.where(ended_at: from..to).order(:ended_at).eager_load(:movies)
    return if events.blank?

    client = TwitterBot.new.client
    events.find_each do |event|
      client.update(event.tweet_text)
    end
  end
end