class TweetSerializer
  include FastJsonapi::ObjectSerializer
  attributes :text
end
