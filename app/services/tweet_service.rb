class TweetService
  include BaseService

  def initialize(text)
    @text = text
  end

  def call
    tweet = TWITTER_REST_CLIENT.update(@text)
    data = {
      tweet_id: tweet.id,
      tweet_path: tweet.uri.path
    }
    OpenStruct.new(success?: true, data: data, error: nil)
  rescue StandardError => e
    log_msg(e, :error)
    OpenStruct.new(success?: false, error: e.message)
  end
end
