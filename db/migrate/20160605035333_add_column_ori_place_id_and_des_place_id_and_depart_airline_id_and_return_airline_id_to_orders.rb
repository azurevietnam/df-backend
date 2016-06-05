class AddColumnOriPlaceIdAndDesPlaceIdAndDepartAirlineIdAndReturnAirlineIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :ori_place_id, :integer
    add_column :orders, :des_place_id, :integer
    add_column :orders, :depart_airline_id, :integer
    add_column :orders, :return_airline_id, :integer
  end
end
