class User < ActiveRecord::Base
  has_secure_password(validations: false)

  validates_confirmation_of :password, if: ->(user) {
      !user.omniauth? && user.password.present?
    }
  validates_presence_of :password, if: ->(user) {
      !user.omniauth?
    }, on: :create
  validates_presence_of :password_confirmation, if: ->(user) {
      !user.omniauth? && user.password.present?
    }

  validates_uniqueness_of :email

  validates_length_of :password, minimum: 8

end
