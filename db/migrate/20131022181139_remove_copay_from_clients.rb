class RemoveCopayFromClients < ActiveRecord::Migration
  def change
  	remove_column :clients, :copay
  end
end
