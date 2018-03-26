class FetchTweetsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    FetchTweets.call
  end
end
