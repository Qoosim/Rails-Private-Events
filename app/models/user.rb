# frozen_string_literal: true

# User model methods and constrains
class User < ApplicationRecord
  before_save { self.email = email.downcase }

  # Allows email validations for correct format
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  validates :username, presence: true, length: { minimum: 3, maximum: 50 }
  validates :password, presence: true, length: { minimum: 6, maximum: 255 }
  validates :email, presence: true, length: { minimum: 10, maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  has_many :attendances
  has_many :events, through: :attendances
end