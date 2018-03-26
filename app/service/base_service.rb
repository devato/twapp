module BaseService

  extend ActiveSupport::Concern

  class_methods do
    def call(*args)
      new(*args).call
    end

  end

  def log_msg(msg, level = :debug)
    Rails.logger.send(level.to_sym, "=================#{level.upcase}: #{self.class}")
    Rails.logger.send(level.to_sym, "=================#{msg}")
  end

  def default_response
    @response = {
      success?: true,
      error: nil
    }
  end
end
