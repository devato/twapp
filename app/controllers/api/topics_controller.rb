class Api::TopicsController < Api::BaseController
  def index
    @topics = Topic.all.select(:id, :name, :slug)
    render json: TopicSerializer.new(@topics), status: :ok
  end
end
