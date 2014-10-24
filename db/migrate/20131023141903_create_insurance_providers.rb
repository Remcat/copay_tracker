class CreateInsuranceProviders < ActiveRecord::Migration
  def change
    create_table :insurance_providers do |t|
      t.integer :client_id
      t.string :name
      t.string :member_id
      t.integer :copay
      t.date :effective_on

      t.timestamps
    end
  end
end
