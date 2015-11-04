class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :doctor_appointments, foreign_key: "user_id", class_name: "Appointment"
  has_many :user_appointments, foreign_key: "doctor_id", class_name: "Appointment"
end
