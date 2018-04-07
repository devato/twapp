class Api::TweetsController < Api::BaseController
  before_action :setup_filter, only: [:list]

  def list
    @tweets = Tweet.latest_for_topic(@topic)
    render json: TweetSerializer.new(@tweets), status: :ok
  end

  def tweet
    service = TweetService.new(params[:text]).call
    if service.success?
      render json: service.data.to_json, status: :ok
    else
      raise ApiErrors::TweetError
    end
  end

  private

  def setup_filter
    raise ApiErrors::MissingParamError::TopicIdMissing unless params[:topic_id].present?
    unless @topic = Topic.find_by(slug: params[:topic_id])
      raise ApiErrors::NotFoundError::TopicNotFound
    end
    @limit = params[:limit] || 10
  end
end
