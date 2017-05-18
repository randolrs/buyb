class PagesController < ApplicationController
  
  def home
  	
  	@email_cta = true

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
