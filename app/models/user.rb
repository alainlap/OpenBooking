class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_one :client
  has_one :provider

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
end
