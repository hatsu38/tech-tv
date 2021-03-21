# bundle exec rails batch:tweet_bot
namespace :batch do
  desc "イベントをTwitterBotがツイート"
  task tweet_bot: :environment do
    # 19:10にボットが動く場合
    # 18:00~18:59:59に開催が終了したイベントをTweetする
    BEFORE_HOUR = 1.hour
    from = Time.zone.now.beginning_of_hour - BEFORE_HOUR
    to = Time.zone.now.end_of_hour - BEFORE_HOUR
    events = Event.where(ended_at: from..to).order(:ended_at).eager_load(:movies)
    next if events.blank?

    client = TwitterBot.new.client
    events.find_each do |event|
      client.update(event.tweet_text)
    end
  end
end