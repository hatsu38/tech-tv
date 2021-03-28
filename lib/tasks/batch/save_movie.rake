namespace :batch do
  # bundle exec rails batch:save_movie
  desc "動画の登録"
  task save_movie: :environment do
    Batch::SaveMovieJob.perform_later
  end
end
