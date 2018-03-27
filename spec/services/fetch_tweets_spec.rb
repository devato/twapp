require 'rails_helper'

RSpec.describe FetchTweets, type: :service do
  subject(:fetch) { described_class.call }

  describe '#call' do
    context 'when topics available' do
      before do
        allow(Topic).to receive(:all).and_return([Topic.new(name: 'milk')])
      end

      it 'should search the twitter api with available topics' do
        expect(TWITTER_REST_CLIENT).to receive(:search).with('milk', any_args).once
        fetch
      end

      it 'should have a successful response' do
        expect(fetch.success?).to eq(true)
      end

      context 'creating fresh tweets' do
        include_examples :twitter_response, '3'

        it 'should create given number of tweets' do
          expect { fetch }.to change { Tweet.count }.by(3)
        end

        context 'when tweet exists' do
          let!(:existing_tweet) { create(:tweet, tweet_id: '123123') }

          before do
            allow(TWITTER_REST_CLIENT).to receive(:search).and_return(
              [build_tweet(id: 123_123)]
            )
          end

          it 'should not create duplicate tweets' do
            expect { fetch }.not_to change { Tweet.count }
          end
        end
      end
    end

    context 'when no topics available' do
      it 'should NOT search the twitter api' do
        expect(TWITTER_REST_CLIENT).not_to receive(:search)
        fetch
      end
    end
  end
end
