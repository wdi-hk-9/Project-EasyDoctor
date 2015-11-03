class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :datetime
      t.string :doctor
      t.string :status
      t.timestamps null: false
    end
  end
end
