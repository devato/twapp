require "rails_helper"

RSpec.describe 'API List Tweets', type: :request do

  describe 'GET /api/tweets' do
    subject(:hit_api) { get '/api/tweets/' }

    it 'should have 422' do
      hit_api
      expect(response).to have_http_status :unprocessable_entity
    end

  end

  describe 'GET /api/tweets/:topic_id' do

    context 'when topic not found' do
      subject(:hit_api) { get '/api/tweets/test' }

      it 'should have 422' do
        hit_api
        expect(response).to have_http_status :unprocessable_entity
      end
    end

    context 'when topic found' do
      let(:topic) { create(:topic, name: 'healthcare') }

      subject(:hit_api) { get list_api_tweets_path(topic) }

      it 'should have a successful response' do
        hit_api
        expect(response).to have_http_status :ok
      end
    end
  end

end
