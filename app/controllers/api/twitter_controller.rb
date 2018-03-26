class Api::TwitterController < ApplicationController

  def index
    @topics = Topic.name_list
    @tweets = Tweet.all
    render json: @tweets, status: :ok
  end

end
