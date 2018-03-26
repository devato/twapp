class Tweet < ApplicationRecord
  belongs_to :topic

  validates_presence_of :topic, :tweet_id, :text, :username

  scope :not_recent, -> { where(arel_table[:created_at].lt(Time.zone.now - 48.hours)) }
end
