class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :buyer_id
      t.integer :seller_id

      t.timestamps
    end
  end
end
