namespace :batch do
  desc "イベントをTwitterBotがツイート"
  task tweet_bot: :environment do
    # 19:05にボットが動く場合
    # 19:00~19:59:59までに開催しているイベントをTweetする
    from = Time.zone.now.beginning_of_day
    to = Time.zone.now.end_of_hour
    events = Event.where(started_at: from..to).order(:started_at).eager_load(:movies)
    next if events.blank?

    client = TwitterBot.new.client
    events.find_each do |event|
      text = generate_tweet_text(event)
      client.update(text)
    end
  end
end

def generate_tweet_text(event)
  # Pickを使うとSQLをまた引いてしまうのでlast.urlとしている
  movie_url = event.movies.last.url
  text = <<EOS
  #{event.title} #{event.format_datetime(event.started_at)}から開催 ##{event.hash_tag}
  #{movie_url}
EOS
end