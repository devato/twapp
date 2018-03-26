require "rails_helper"

RSpec.describe 'API Topics index', type: :request do

  describe 'GET /api/topics' do
    subject(:hit_api) { get api_topics_path }

    context 'when no topics' do

      before do
        hit_api
        @parsed_body = JSON.parse(response.body)
      end

      it 'should have 200' do
        expect(response).to have_http_status :ok
      end

      it 'should be an empty list' do
        expect(@parsed_body['data']).to eq([])
      end
    end

    context 'when topics exist' do

      let!(:topic) { create(:topic, name: 'findme') }

      before do
        hit_api
        @parsed_body = JSON.parse(response.body)
      end

      it 'should have 200' do
        expect(response).to have_http_status :ok
      end

      it 'should include the topic'  do
        expect(@parsed_body['data'][0]['id']).to eq(topic.id.to_s)
      end
    end

  end

end
