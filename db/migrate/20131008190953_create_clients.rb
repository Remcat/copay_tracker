class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.integer :copay
      t.date :effective_on

      t.timestamps
    end
  end
end
