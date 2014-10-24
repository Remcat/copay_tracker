class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :client_id
      t.date :occured_on
      t.time :start
      t.time :end
      t.boolean :copay_received

      t.timestamps
    end
  end
end
