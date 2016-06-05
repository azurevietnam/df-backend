class RemoveColumnsFromCustomers < ActiveRecord::Migration
  def change
    remove_column :customers, :contact_gender, :boolean
    remove_column :customers, :contact_note, :text
    remove_column :customers, :admin_note, :text
  end
end
