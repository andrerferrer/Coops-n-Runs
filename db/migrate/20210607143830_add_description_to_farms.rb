class AddDescriptionToFarms < ActiveRecord::Migration[6.0]
  def change
    add_column :farms, :description, :text
  end
end
