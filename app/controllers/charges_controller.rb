class ChargesController < ApplicationController
	
	def create
		

	end

	

	def initial_payment

		if user_signed_in?

			token = Stripe::Token.create(

				:card => {
					:number => params[:credit_card_number],
					:exp_month => params[:expMonth],
					:exp_year => params[:expYear],
					:cvc => params[:cvc]

				},
			)

			customer = Stripe::Customer.create(
				
				:card  => token.id

			)

			price = 29 * 100 #needs to be changed to dynamic

			charge = Stripe::Charge.create(

				:customer    => customer.id,
				:amount      => price.to_i,
				:description => 'Rails Stripe customer',
				:currency    => 'usd'

			)

			purchase = Purchase.create(email: params[:stripeEmail], stripe_card_id: params[:stripeToken], 
			amount: price, description: charge.description, currency: charge.currency,
			stripe_customer_id: customer.id, ip_address: request.remote_ip)

			current_user.update(:initiated_payment => true)

			redirect_to personalize_path

		else

			redirect_to enter_payment_path

		end

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to enter_payment_path and return
	end

end
