class AddUrlToFarms < ActiveRecord::Migration[6.0]
  def change
    add_column :farms, :website-url, :string
  end
end
