class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name, :null => false
      t.string :phone, :null => false
      t.string :email
      t.boolean :gender

      t.timestamps null: false
    end
  end
end
