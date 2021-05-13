class FoodItemsController < ApplicationController
	def index
	end

	def new
		@food_item = FoodItem.new
	end

	def create
		@create_items = current_user.food_items.create(food_item_params)
		redirect_to root_path 
	end

	def edit	
		@food_item = FoodItem.find(params[:id])	
	end

	def update
		@food_item = FoodItem.find(params[:id])	
		@updated_item = @food_item.update_attributes(food_item_params)
		redirect_to root_path 
	end

	def destroy
		@food_item = FoodItem.find(params[:id])
		@food_item.destroy
		redirect_to root_path 
	end

	def apply
		seller_id = FoodItem.find(params[:id]).user_id
		order = current_user.orders.create(food_item_id: params[:id], seller_id: seller_id)
		send_mail = OrderMailer.order_received(current_user, order).deliver_now
		redirect_to root_path
	end

	def cancel
		order = current_user.orders.where(food_item_id: params[:id]).first
		order.destroy
		send_mail = OrderMailer.order_cancelled(current_user, order).deliver_now
		redirect_to root_path
	end

	def orders_list
		@orders = Order.where(seller_id: current_user.id)
		@food_item_id = @orders.map{|o| o.food_item_id }.uniq
		@food_items = FoodItem.where(id: @food_item_id)
	end

	private
	def food_item_params
    params.require(:food_item).permit(:name, :description, :price)
  end
end
