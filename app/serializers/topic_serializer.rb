class TopicSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :slug
end
