class ChangeGenderTypeInCustomersOrderPaxesOrders < ActiveRecord::Migration
  def change
    change_column :customers, :gender, 'integer USING CAST(gender AS integer)'
    change_column :order_paxes, :gender, 'integer USING CAST(gender AS integer)'
    change_column :orders, :contact_gender, 'integer USING CAST(contact_gender AS integer)'
  end
end
