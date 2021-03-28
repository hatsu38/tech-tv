# bundle exec rails batch:tweet_bot
namespace :batch do
  desc "イベントをTwitterBotがツイート"
  task tweet_bot: :environment do
    # 19:10にボットが動く場合
    # 18:00~18:59:59に開催が終了したイベントをTweetする
    BEFORE_HOUR = 1.hour
    from = Time.zone.now.beginning_of_hour - BEFORE_HOUR
    to = Time.zone.now.end_of_hour - BEFORE_HOUR
    Batch::EventTweetJob.new.perform(from, to)
  end
end