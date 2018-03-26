class ApiErrorsSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes :status, :code, :message
end

