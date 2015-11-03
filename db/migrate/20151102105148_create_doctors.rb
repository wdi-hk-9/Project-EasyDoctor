class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :district
      t.string :address
      t.string :phone
      t.string :password_digest
      t.timestamps null: false
    end
  end
end
