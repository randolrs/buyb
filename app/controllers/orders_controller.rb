class OrdersController < ApplicationController
  
  def add_offer_to_order

  	
  	@offer = Offer.where(:name_url_slug => params[:offer_url_slug]).last

  	
  	if @offer

	  	if user_signed_in?

	  		if Order.where(:user_id => current_user.id)

	  			#user has order

	  		else

	  			#user does not have order, need to create

	  		end


	  	else

	  		if session[:id]

	  			#session has id

	  			@order = Order.where(:session_id => session[:id]).last

	  			if @order

	  				#session has existing order

	  				OrderOffer.create(:offer_id => @offer.id, :order_id => @order.id)

	  				redirect_to review_order_path(@order.id) and return

	  			else

	  				#session does not have order, need to create

	  				@order = Order.create(:session_id => session[:id])

		  			OrderOffer.create(:offer_id => @offer.id, :order_id => @order.id)

		  			redirect_to review_order_path(@order.id) and return

	  			end


	  		else

	  			#session does not have id, need to create one

	  			order_session = OrderSession.create

	  			session[:id] = order_session.id

	  			order_session.update(:session_id => session[:id])

	  			@order = Order.create(:session_id => session[:id])

  				OrderOffer.create(:offer_id => @offer.id, :order_id => @order.id)

  				redirect_to review_order_path(@order.id) and return

	  		end

	  	end


	  else

	  	redirect_to root_path and return

	  end


  end




  def review

  	@order = Order.find(params[:order_id])

  	unless @order

  		redirect_to root_path

  	end
  	

  end


end
