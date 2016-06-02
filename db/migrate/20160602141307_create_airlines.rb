class CreateAirlines < ActiveRecord::Migration
  def change
    create_table :airlines do |t|
      t.integer :type
      t.string :name
      t.string :short_name

      t.timestamps null: false
    end
  end
end
