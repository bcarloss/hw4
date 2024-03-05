class User < ApplicationRecord
  has_secure_password

  # Associations
  has_many :places, dependent: :destroy
  has_many :entries, dependent: :destroy

  # Validations
  validates :first_name, :last_name, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: false }
end
