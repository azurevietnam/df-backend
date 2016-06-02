class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_number, :null => false
      t.integer :customer_id
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_email

      t.integer :round_type, :default => 1
      t.string :ori_code
      t.string :ori_name
      t.string :ori_name_unsigned
      t.string :des_code
      t.string :des_name
      t.string :des_name_unsigned
      t.integer :adult, :default => 1
      t.integer :child, :default => 0
      t.integer :infant, :default => 0
      t.integer :status, :default => 1

      t.string :depart_airline_name
      t.string :depart_airline_short_name
      t.integer :depart_airline_type
      t.string :depart_flight_code
      t.date :depart_date
      t.time :depart_from_time
      t.time :depart_to_time
      t.string :depart_book_code
      t.timestamps :depart_expired

      t.string :return_airline_name
      t.string :return_airline_short_name
      t.integer :return_airline_type
      t.string :return_flight_code
      t.date :return_date
      t.time :return_from_time
      t.time :return_to_time
      t.string :return_book_code
      t.timestamps :return_expired

      t.integer :depart_web_price_net, :default => 0
      t.integer :depart_total, :default => 0

      t.integer :return_web_price_net, :default => 0
      t.integer :return_total, :default => 0

      t.integer :total_price, :default => 0

      t.timestamps null: false
    end
  end
end
