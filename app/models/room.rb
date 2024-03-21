class Room < ApplicationRecord
  has_many :messages, -> { order(:id) }

  validates_uniqueness_of :name
end
