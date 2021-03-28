namespace :fix do
  # bundle exec rails fix:thumbnail_url_add_event
  desc "動画の登録"
  task thumbnail_url_add_event: :environment do
    events = Event.joins(:movies).distinct

    events.each do |event|
      movie = event.movies[0]
      begin
        event.update(thumbnail_url: movie.thumbnail_url)
      rescue StandardError => e
        Rails.logger.error(e.message)
        Raven.capture_exception(e)
      end
    end
  end
end
