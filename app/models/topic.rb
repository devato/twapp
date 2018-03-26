class Topic < ApplicationRecord
  has_many :tweets

  scope :name_list, -> { all.map(&:name) }
end
