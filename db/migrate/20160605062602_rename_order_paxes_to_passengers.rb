class RenameOrderPaxesToPassengers < ActiveRecord::Migration
  def change
    rename_table :order_paxes, :passengers
  end
end
