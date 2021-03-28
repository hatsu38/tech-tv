# bundle exec rails batch:tweet_bot
namespace :batch do
  desc "イベントをTwitterBotがツイート"
  task tweet_bot: :environment do
    # 19:10にボットが動く場合
    # 18:00~18:59:59に開催が終了したイベントをTweetする
    before_hour = 1.hour
    from = Time.zone.now.beginning_of_hour - before_hour
    to = Time.zone.now.end_of_hour - before_hour
    Batch::EventTweetJob.perform_later(from, to)
  end
end
