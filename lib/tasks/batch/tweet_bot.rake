# bundle exec rails batch:tweet_bot
namespace :batch do
  desc "イベントをTwitterBotがツイート"
  task tweet_bot: :environment do
    # 19:05にボットが動く場合
    # 19:00~19:59:59までに開催しているイベントをTweetする
    from = Time.zone.now.beginning_of_hour
    to = Time.zone.now.end_of_hour
    events = Event.where(started_at: from..to).order(:started_at).eager_load(:movies)
    next if events.blank?

    client = TwitterBot.new.client
    events.find_each do |event|
      client.update(event.tweet_text)
    end
  end
end