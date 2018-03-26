class FetchTweetsWorker
  include Sidekiq::Worker

  def perform(*args)
    FetchTweets.call
  end
end
