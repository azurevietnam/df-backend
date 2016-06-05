class AddShortNameColumnToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :short_name, :string
  end
end
