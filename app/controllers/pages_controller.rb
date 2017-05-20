class PagesController < ApplicationController
  
  def home
  	
  	unless session[:email]
  		@email_cta = true
  	end
  	
  end



  def category_index

    @offers = Offer.all

  end



  def newsletter_signups

    if user_signed_in?

      if current_user.is_admin

        @signups = NewsletterSignup.all

      else


        redirect_to root_path

      end

    else

      redirect_to root_path

    end

  end

  def create_newsletter_subscriber
  	
  	@email = params[:email]
  	
  	if @email

  		NewsletterSignup.create(:email => @email, :signup_ip => request.remote_ip)

  		session[:email] = @email

  		render json: { :status => "success", :report => @email, content_type: 'text/json' }

  	else

  		render json: { :status => "failure", :report => @email, content_type: 'text/json' }
  	end
      

  end

end
