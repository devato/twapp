class PruneTweetsWorker
  include Sidekiq::Worker

  def perform(*args)
    PruneTweets.call
  end
end
