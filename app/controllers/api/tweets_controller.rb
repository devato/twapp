class Api::TweetsController < ApplicationController

  before_action :setup_filter, only: [:list]


  def list

  end

  private

  def setup_filter
    raise ApiErrors::MissingParamError::TopicIdMissing.new unless params[:topic_id].present?

    @topic = Topic.find(params[:topic_id])
    @limit = params[:limit] || 10
  end

end
