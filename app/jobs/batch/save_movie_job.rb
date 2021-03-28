class Batch::SaveMovieJob < ApplicationJob
  queue_as :default
  def perform(args = {})
    YOUTUBE_LIVE_KEYWORD = "youtu.be"
    MOVIE_LINK_PATTERN = /https?:\/\/youtu.be\/\w+/

    events = Event.where('description like ? ', "%#{YOUTUBE_LIVE_KEYWORD}%").pluck(:id, :description)
    return if events.size == Movie.count

    events.each do |event|
      event_id = event[0]
      description = event[1]
      movie_link_ary = description.scan(MOVIE_LINK_PATTERN).uniq

      movie_link_ary.each_with_index do |movie_link, i|
        begin
          movie = Movie.find_or_create_by!(url: movie_link)
          EventMovie.find_or_create_by!(event_id: event_id, movie_id: movie.id)
          Event.find(event_id).update(thumbnail_url: movie.thumbnail_url)
        rescue => exception
          Rails.logger.error(exception.message)
          Raven.capture_exception(exception) if Rails.env.production?
        end
      end
    end
  end
end