class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :postal_code, :string
    add_column :users, :prefecture, :string
    add_column :users, :city, :string
    add_column :users, :area, :string
    add_column :users, :self_introduction, :string
  end
end
