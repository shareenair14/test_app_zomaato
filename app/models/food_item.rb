class FoodItem < ApplicationRecord
	has_many :orders, dependent: :destroy
  has_many :users
end
