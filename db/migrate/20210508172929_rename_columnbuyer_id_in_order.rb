class RenameColumnbuyerIdInOrder < ActiveRecord::Migration[6.0]
  def change
  	rename_column :orders, :buyer_id, :user_id
  	rename_column :orders, :seller_id, :food_item_id
  end
end
