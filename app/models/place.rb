class Place < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :entries, dependent: :destroy

  # Validations
  validates :name, presence: true
end
