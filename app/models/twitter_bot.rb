class TwitterBot
  attr_accessor :client
  def initialize
    self.client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.credentials.twitter[:consumer_key]
      config.consumer_secret     = Rails.application.credentials.twitter[:consumer_secret_key]
      config.access_token        = Rails.application.credentials.twitter[:access_token]
      config.access_token_secret = Rails.application.credentials.twitter[:access_secret_token]
    end
  end
end
