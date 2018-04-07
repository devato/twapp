require 'rails_helper'

RSpec.describe TweetService, type: :service do
  subject(:tweet) { described_class.new('testweet').call }

  include_examples :twitter_response

  describe '#call' do

    before do
      allow(TWITTER_REST_CLIENT).to receive(:update)
        .and_return(build_tweet(id: 123123, path: '/testuser/123123'))
    end

    it 'calls update on twitter client' do
      expect(TWITTER_REST_CLIENT).to receive(:update)
      tweet
    end

    it 'is responds with tweet data' do
      service = tweet
      expect(service.data[:tweet_id]).to eq(123123)
      expect(service.data[:tweet_path]).to eq('/testuser/123123')
    end

  end

end
