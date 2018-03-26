module ApiErrors
  class MissingParamError < ApiErrors::BaseError
    class TopicIdMissing < ApiErrors::MissingParamError

    end
  end
end

