class ApiErrorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :status, :code, :message
end

