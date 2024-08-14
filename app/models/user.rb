class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true, uniqueness: true

  after_create :send_registration_email
  before_create :try

  private

  def send_registration_email
    UserMailer.registration_confirmation(self).deliver_now
  end

  def try
    debugger
  end
end

