class Tweet < ApplicationRecord
  belongs_to :topic

  scope :most_recent, -> (amt = 10) { order(created_at: :desc).limit(amt) }

end
