class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :ori_code
      t.string :des_code
      t.boolean :is_domestic 

      t.timestamps null: false
    end
  end
end
