class TweetSerializer
  require 'action_view'
  require 'action_view/helpers'
  include ActionView::Helpers::DateHelper
  include FastJsonapi::ObjectSerializer
  attributes :tweet_id, :username, :full_text, :tweeted_at

end
