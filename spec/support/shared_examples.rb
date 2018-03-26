shared_examples_for :twitter_response do |num|

  def build_tweet(opts = {})
    OpenStruct.new(id: opts.fetch(:id, FFaker::SSNSE.ssn),
                   text: opts.fetch(:text, FFaker::Tweet.body),
                   user: OpenStruct.new(screen_name: FFaker::Internet.user_name),
                   text?: opts.fetch(:text_present, true),
                   user?: opts.fetch(:user_present, true))
  end

  def build_tweets(num = 3)
    tweets = []
    num.to_i.times do
      tweets << build_tweet
    end
    tweets
  end

  before do
    allow(TWITTER_REST_CLIENT).to receive(:search).and_return(
      build_tweets(num)
    )
  end
end
