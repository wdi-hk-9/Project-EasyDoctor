class Appointment < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :doctor, class_name: "User"
end
