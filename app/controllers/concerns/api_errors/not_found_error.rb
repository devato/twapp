module ApiErrors
  class NotFoundError < ApiErrors::BaseError
    class TopicNotFoundError < ApiErrors::NotFoundError

    end
  end
end

