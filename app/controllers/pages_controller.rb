class PagesController < ApplicationController
  
  def home
  	
  	unless session[:email]
  		@email_cta = true
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
