class Room < ApplicationRecord
  has_many :messages, -> { order(:id) }
  has_many :users, through: :messages

  validates_uniqueness_of :name
end
