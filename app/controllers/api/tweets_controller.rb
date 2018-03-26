class Api::TweetsController < Api::BaseController

  before_action :setup_filter, only: [:list]


  def list

  end

  private

  def setup_filter
    raise ApiErrors::MissingParamError::TopicIdMissing.new unless params[:topic_id].present?
    unless @topic = Topic.find_by(id: params[:topic_id])
      raise ApiErrors::NotFoundError::TopicNotFound.new
    end
    @limit = params[:limit] || 10
  end

end
