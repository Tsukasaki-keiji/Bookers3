class RemoveShopNameToBook < ActiveRecord::Migration[5.2]
  def change
     remove_column :books, :shop_name, :text
  end
end
