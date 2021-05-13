class AddPriceToFoodItem < ActiveRecord::Migration[6.0]
  def change
    add_column :food_items, :price, :decimal
  end
end
