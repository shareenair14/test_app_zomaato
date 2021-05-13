class WelcomeController < ApplicationController
  def index
  	if current_user.present?
	  	if current_user.seller
	  		@foods = current_user.food_items
	  	else
	  		@foods = FoodItem.all
	  	end
  	end
  end
end
