class Doctor < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
