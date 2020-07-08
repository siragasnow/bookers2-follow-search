class AddMapinfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :latitude, :float  # 緯度
    add_column :users, :longitude, :float　　# 経度
  end
end
