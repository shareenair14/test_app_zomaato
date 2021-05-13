class Order < ApplicationRecord
	belongs_to :user
  belongs_to :food_item

  def get_seller
  	seller = FoodItem.find(self.food_item_id).user_id
  	seller = User.find(seller)
  end
end
