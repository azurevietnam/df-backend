class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :airlines, :type, :category
    rename_column :order_paxes, :type, :category
  end
end
