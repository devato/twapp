class FetchTweets

  include BaseService

  def initialize(keep = 10)
    @keep = keep
    @new_tweets = []
    prune_tweets
  end

  def call
    @topics = Topic.all
    @topics.each do |topic|
      TWITTER_REST_CLIENT.search(topic.name, lang: 'en', result_type: 'recent')
                         .take(10).collect do |tweet|
        next unless tweet.text? && tweet.user?
        @new_tweets << Tweet.create!({
          text: tweet.text,
          full_text: tweet.full_text,
          username: tweet.user.screen_name,
          topic: topic,
          created_at: tweet.created_at,
        })
      end
    end
    OpenStruct.new(success?: true, new_tweets: @new_tweets, error: nil)
  rescue => e
    log_msg(e, :error)
    OpenStruct.new(success?: false, error: e.message)
  end

  private

  def prune_tweets
    Tweet.where.not(id: Tweet.most_recent(@keep)).destroy_all
  end

end
