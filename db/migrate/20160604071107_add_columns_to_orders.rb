class AddColumnsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :contact_gender, :boolean
    add_column :orders, :contact_note, :text
    add_column :orders, :admin_note, :text
  end
end
