class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :lastname, :login, :password, :password_confirmation

  validates :email, uniqueness: true, presence: true

  validates :login, uniqueness: true, presence: true

  validates :password, presence: true, confirmation: true

  validates_confirmation_of :password
end
