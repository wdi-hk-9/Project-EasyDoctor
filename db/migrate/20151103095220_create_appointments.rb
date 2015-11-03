class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :datetime
      t.integer :doctor_id
      t.integer :user_id
      t.string :status
      t.timestamps null: false
    end
  end
end
