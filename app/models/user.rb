class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  # Add any other validations you might need (e.g., format of the email)
end
