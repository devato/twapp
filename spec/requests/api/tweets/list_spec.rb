require 'rails_helper'

RSpec.describe 'API List Tweets', type: :request do
  describe 'GET /api/tweets' do
    subject(:hit_api) { get '/api/tweets/' }

    it 'should have 422' do
      hit_api
      expect(response).to have_http_status :unprocessable_entity
    end
  end

  describe 'GET /api/tweets/:topic_id' do
    context 'when tweet topic not found' do
      subject(:hit_api) { get '/api/tweets/test' }

      it 'should have 422' do
        hit_api
        expect(response).to have_http_status :unprocessable_entity
      end
    end

    context 'when tweet topic found' do
      let(:topic)  { create(:topic, name: 'healthcare') }
      let!(:tweet) { create(:tweet, topic: topic) }

      subject(:hit_api) { get list_api_tweets_path(topic) }

      before do
        hit_api
        @parsed_body = JSON.parse(response.body)
      end

      it 'should have a successful response' do
        expect(response).to have_http_status :ok
      end

      it 'should have tweet data in the response' do
        expect(@parsed_body['data'][0]['id']).to eq(tweet.id.to_s)
      end
    end
  end
end
