class Topic < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: %i[slugged finders]

  has_many :tweets

  scope :name_list, -> { all.map(&:name) }
end
