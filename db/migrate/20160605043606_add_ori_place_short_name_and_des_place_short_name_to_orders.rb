class AddOriPlaceShortNameAndDesPlaceShortNameToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :ori_short_name, :string
    add_column :orders, :des_short_name, :string
  end
end
