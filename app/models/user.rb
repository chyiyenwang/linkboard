class User < ActiveRecord::Base
  validates :email,
  presence: true,
  uniqueness: {case_sensitive: false},
  email: true

  validates :password,
  presence: true

  validates :name,
  presence: true,
  length: {maximum: 20}

  has_secure_password

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end
end
