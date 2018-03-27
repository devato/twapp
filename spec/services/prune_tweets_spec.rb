require 'rails_helper'

RSpec.describe PruneTweets, type: :service do
  let!(:recent_tweet) { create(:tweet, created_at: Time.zone.now) }

  subject(:prune) { described_class.call }

  describe '#call' do
    context 'when there are tweets to prune' do
      let!(:outdated_tweet) { create(:tweet, created_at: 1.year.ago) }

      it 'should search the twitter api with available topics' do
        prune
        expect(Tweet.all).not_to include(outdated_tweet)
      end
    end

    context 'when all tweets are recent' do
      it 'should not prune anything' do
        expect { prune }.not_to change { Tweet.count }
      end
    end
  end
end
