class AddCopayToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :copay, :integer
  end
end
