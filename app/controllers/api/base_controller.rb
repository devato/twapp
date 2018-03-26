class Api::BaseController < ApplicationController
  rescue_from ApiErrors::BaseError, with: :render_error_response

  def render_error_response(error)
    render json: error, serializer: ApiErrorsSerializer, status: 200
  end
end
