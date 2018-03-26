require "rails_helper"

RSpec.describe Tweet, type: :model do

  let!(:recent_tweet)   { create(:tweet, created_at: Time.zone.now) }
  let!(:outdated_tweet) { create(:tweet, created_at: 1.year.ago) }

  describe 'Validations' do
   it { should validate_presence_of(:topic) }
   it { should validate_presence_of(:tweet_id) }
   it { should validate_presence_of(:text) }
   it { should validate_presence_of(:username) }
  end

  describe '#not_recent' do

    subject(:not_recent) { described_class.not_recent }

    it 'should include outdated' do
      expect(not_recent).to include(outdated_tweet)
    end

    it 'should NOT include recent tweet' do
      expect(not_recent).not_to include(recent_tweet)
    end
  end
end
