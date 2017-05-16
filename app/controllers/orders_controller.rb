class OrdersController < ApplicationController
  
  def add_offer_to_order

  	
  	@offer = Offer.where(:name_url_slug => params[:offer_url_slug]).last

  	
  	if @offer

	  	if user_signed_in?

	  		if Order.where(:user_id => current_user.id, :completed => nil)

	  			#user has order

	  		else

	  			#user does not have order, need to create

	  		end


	  	else

	  		if session[:id]

	  			#session has id

	  			@order = Order.where(:session_id => session[:id], :completed => nil).last

	  			if @order

	  				#session has existing order

	  				OrderOffer.create(:offer_id => @offer.id, :order_id => @order.id, :quantity => 1)

	  				redirect_to review_order_path(@order.id) and return

	  			else

	  				#session does not have order, need to create

	  				@order = Order.create(:session_id => session[:id])

		  			OrderOffer.create(:offer_id => @offer.id, :order_id => @order.id, :quantity => 1)

		  			redirect_to review_order_path(@order.id) and return

	  			end


	  		else

	  			#session does not have id, need to create one

	  			order_session = OrderSession.create

	  			session[:id] = order_session.id

	  			order_session.update(:session_id => session[:id])

	  			@order = Order.create(:session_id => session[:id])

  				OrderOffer.create(:offer_id => @offer.id, :order_id => @order.id, :quantity => 1)

  				redirect_to review_order_path(@order.id) and return

	  		end

	  	end


	else

		flash[:error] = "Sorry, we cannot find your order"
		redirect_to :back and return

	end


  end




  def review

  	@order = Order.find(params[:order_id])

  	unless @order

  		redirect_to root_path

  	end
  	

  end

  def confirm_and_pay_for_order

  	if params[:order_id]

  		@order = Order.find(params[:order_id])

  		if @order

  			@order.update(:contact_email => params[:contact_email], :mailing_address => params[:mailing_address])

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

			price = 2500 #needs to be changed to @order.total_price * 100

			charge = Stripe::Charge.create(

				:customer    => customer.id,
				:amount      => price,
				:description => 'Rails Stripe customer',
				:currency    => 'usd'

			)

			purchase = Purchase.create(email: params[:stripeEmail], stripe_card_id: params[:stripeToken], 
			amount: price, description: charge.description, currency: charge.currency,
			stripe_customer_id: customer.id, order_id: @order.id, ip_address: request.remote_ip)

			@order.update(:completed => true)

			if user_signed_in?
				
				if params[:user_id]

					purchase.update(:user_id => params[:user_id])

				end

			end

  			redirect_to order_confirmation_path(@order.id) and return

  		else

  			redirect_to root_path and return

  		end

  	else

  		redirect_to root_path and return

  	end

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to review_order_path(@order.id) and return
	end



	def confirmation



	end

	def update_order_offer_quantity

		@order_offer = OrderOffer.find(params[:order_offer_id])
		new_quantity = params[:new_quantity]
		
		if @order_offer

			@order_offer.update(:quantity => new_quantity)

		end


	end



end
