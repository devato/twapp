class PruneTweetsWorker
  include Sidekiq::Worker

  def perform(*_args)
    PruneTweets.call
  end
end
