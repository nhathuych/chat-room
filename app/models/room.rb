class Room < ApplicationRecord
  has_many :messages, -> { order(:id) }
  has_many :users, through: :messages

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
