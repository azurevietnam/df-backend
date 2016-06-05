class AddExpiredTimeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :depart_expired, :datetime
    add_column :orders, :return_expired, :datetime
    add_column :orders, :time_expired, :datetime
  end
end
