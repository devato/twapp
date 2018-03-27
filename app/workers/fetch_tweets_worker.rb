class FetchTweetsWorker
  include Sidekiq::Worker

  def perform(*_args)
    FetchTweets.call
  end
end
