class Api::TweetsController < Api::BaseController

  before_action :setup_filter, only: [:list]


  def list
    @tweets = Tweet.latest_for_topic(@topic)
    render json: TweetSerializer.new(@tweets), status: :ok
  end

  private

  def setup_filter
    Rails.logger.info(params)
    raise ApiErrors::MissingParamError::TopicIdMissing.new unless params[:topic_id].present?
    unless @topic = Topic.find_by(slug: params[:topic_id])
      raise ApiErrors::NotFoundError::TopicNotFound.new
    end
    @limit = params[:limit] || 10
  end

end
