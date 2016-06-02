class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :code
      t.string :name
      t.string :name_unsigned
      t.boolean :is_domestic
      t.boolean :available

      t.timestamps null: false
    end
  end
end
