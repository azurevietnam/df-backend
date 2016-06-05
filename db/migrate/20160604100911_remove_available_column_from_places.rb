class RemoveAvailableColumnFromPlaces < ActiveRecord::Migration
  def change
    remove_column :places, :available, :string
  end
end
