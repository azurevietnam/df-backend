class CreateSmsMessages < ActiveRecord::Migration
  def change
    create_table :sms_messages do |t|
      t.integer :order_id
      t.integer :type
      t.string :content
      t.string :to_phone
      t.integer :trans_id
      t.integer :total_sms
      t.integer :total_price

      t.timestamps null: false
    end
  end
end
