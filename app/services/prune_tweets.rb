class PruneTweets
  include BaseService

  def call
    Tweet.not_recent.destroy_all
    OpenStruct.new(success?: true, new_tweets: @new_tweets, error: nil)
  rescue StandardError => e
    log_msg(e, :error)
    OpenStruct.new(success?: false, error: e.message)
  end
end
