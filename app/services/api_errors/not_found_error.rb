module ApiErrors
  class NotFoundError < ApiErrors::BaseError
    class TopicNotFound < ApiErrors::NotFoundError
    end
  end
end
