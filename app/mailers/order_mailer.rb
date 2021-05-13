class OrderMailer < ApplicationMailer
	def order_received(user, order)
		@user = user
		seller = order.get_seller
		mail(to: seller.email, subject: "You got a new order!")
	end

	def order_cancelled(user, order)
		@user = user
		seller = order.get_seller
		mail(to: seller.email, subject: "Cancelled Order!")
	end
end
