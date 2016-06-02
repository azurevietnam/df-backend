class CreateOrderPaxes < ActiveRecord::Migration
  def change
    create_table :order_paxes do |t|
      t.integer :order_id
      t.integer :no
      t.string :name
      t.boolean :gender
      t.integer :type
      t.date :birth
      t.integer :depart_lug_weight
      t.integer :return_lug_weight

      t.timestamps null: false
    end
  end
end
