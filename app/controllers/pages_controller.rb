class PagesController < ApplicationController
  
  def home
  	
  	unless session[:email]
  		@email_cta = true
  	end

    @offer_category = OfferCategory.where(:home_page => true).last


  	
  end



  def offer_category_index

    @offer_category = OfferCategory.where(:url_slug => params[:category_url_slug]).last

    unless @offer_category

      redirect_to root_path

    end

    @offers = @offer_category.offers


  end

  def offer_category_type_index

    @offer_category = OfferCategory.where(:url_slug => params[:category_url_slug]).last

    @type = params[:type]

    @type = @type.capitalize

    unless @offer_category

      redirect_to root_path

    end

    @offers = @offer_category.offers

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

  def email_signup

    @hide_header = true

  end

  def create_newsletter_subscriber
  	
  	@email = params[:email]
  	
  	if @email

  		NewsletterSignup.create(:email => @email, :signup_ip => request.remote_ip)

  		session[:email] = @email

      if params[:redirect_url]

        redirect_url = params[:redirect_url]

        render json: { :status => "success", :report => @email, :redirect_to_url => redirect_url, content_type: 'text/json' }

      else

        render json: { :status => "success", :report => @email, :redirect_to_url => nil, content_type: 'text/json' }

      end


  	else

  		render json: { :status => "failure", :report => @email, content_type: 'text/json' }
  	end
      

  end

end
