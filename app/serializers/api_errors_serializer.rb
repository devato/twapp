class ApiErrorsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :status, :code, :message
end

