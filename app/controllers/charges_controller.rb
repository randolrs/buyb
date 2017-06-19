class ChargesController < ApplicationController
	
	def create
		

	end

	

	def initial_payment

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

		price = 19 * 100 #needs to be changed to dynamic

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

	end

end
