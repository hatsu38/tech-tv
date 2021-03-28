namespace :batch do
  # bundle exec rails batch:save_event
  desc "イベント登録"
  task save_event: :environment do
    Batch::SaveEventJob.perform_later
  end
end
