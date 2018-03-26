class TweetSerializer
  include FastJsonapi::ObjectSerializer
  attributes :tweet_id, :text, :username
end
