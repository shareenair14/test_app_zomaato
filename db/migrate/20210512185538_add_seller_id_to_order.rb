class AddSellerIdToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :seller_id, :integer
  end
end
