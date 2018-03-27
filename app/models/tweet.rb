class Tweet < ApplicationRecord
  belongs_to :topic

  validates_presence_of :topic, :tweet_id, :text, :username

  scope :not_recent, -> { where(arel_table[:created_at].lt(Time.zone.now - 1.hour)) }

  scope :latest_for_topic, -> (topic ) {
    where(topic: topic).order(created_at: :desc).limit(10)
  }


  def tweeted_at
    diff_seconds = Time.now - created_at
    case diff_seconds
    when 0 .. 59
      return "#{diff_seconds.to_i} seconds ago"
    when 60 .. (3600-1)
      return "#{(diff_seconds/60).to_i} minutes ago"
    when 3600 .. (3600*24-1)
      return "#{(diff_seconds/3600).to_i} hours ago"
    when (3600*24) .. (3600*24*30)
      return "#{(diff_seconds/(3600*24)).to_i} days ago"
    else
      return created_at.strftime("%m/%d/%Y")
    end
  end
end
