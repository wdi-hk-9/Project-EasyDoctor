class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.time :datetime
      t.string :status
      t.timestamps null: false
    end
  end
end
