class Api::BaseController < ApplicationController
  rescue_from ApiErrors::BaseError, with: :render_error_response

  def render_error_response(error)
    Rails.logger.debug("========: #{error.inspect}")
    render json: ApiErrorSerializer.new(error), status: :unprocessable_entity
  end
end
