module ApiErrors
  class BaseError < StandardError
    attr_reader :id, :status, :code, :message

    ERROR_DESCRIPTION = proc { |code, message|
      { status: 'error', code: code, message: message }
    }

    ERROR_CODE_MAP = {
      'MissingParamError::TopicIdMissing' =>
        ERROR_DESCRIPTION.call(1000, 'topic_id is required to list tweets'),
      'NotFoundError::TopicNotFound' =>
        ERROR_DESCRIPTION.call(2000, 'topic not found by the given id')
    }.freeze

    def initialize
      error_type = self.class.name.scan(/ApiErrors::(.*)/).flatten.first
      ApiErrors::BaseError::ERROR_CODE_MAP
        .fetch(error_type, {}).each do |attr, value|
        instance_variable_set("@#{attr}".to_sym, value)
      end
    end
  end
end
