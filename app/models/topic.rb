class Topic < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  has_many :tweets

  scope :name_list, -> { all.map(&:name) }
end
