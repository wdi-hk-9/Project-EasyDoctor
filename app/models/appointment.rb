class Appointment < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :doctor, class_name: "User"

  validates_presence_of :user_id
  validates_presence_of :doctor_id
  validates_uniqueness_of :user_id, scope: [:doctor_id, :datetime]
  validates_uniqueness_of :doctor_id, scope: [:user_id, :datetime]
end
