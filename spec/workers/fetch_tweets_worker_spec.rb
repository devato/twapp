require 'rails_helper'

RSpec.describe FetchTweetsWorker, type: :worker do
  subject(:worker) { described_class.perform_async }

  describe '.perform' do
    it 'queues the job' do
      expect { worker }.to change(described_class.jobs, :size).by(1)
    end
  end
end
