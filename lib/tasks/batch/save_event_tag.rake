namespace :batch do
  # bundle exec rails batch:save_event_tag
  desc "イベント登録"
  task save_event_tag: :environment do
    Batch::SaveEventTagJob.perform_later
  end

  # bundle exec rails batch:save_event_tag_diff_days[1]
  desc "新着と新しい更新イベントのみ更新"
  task :save_event_tag_diff_days, ['diff_days'] => :environment do |tasks, args|
    today = Date.today
    from_day = today - args[:diff_days].to_i.days
    Batch::SaveEventTagDiffDaysJob.perform_later(today: today, from_day: from_day)
  end
end