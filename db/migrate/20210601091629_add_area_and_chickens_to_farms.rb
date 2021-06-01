class AddAreaAndChickensToFarms < ActiveRecord::Migration[6.0]
  def change
    add_column :farms, :area, :float
    add_column :farms, :chicken_count, :integer
  end
end
