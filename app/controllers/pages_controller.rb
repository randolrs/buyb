class PagesController < ApplicationController
  
  def home
  	
    unless user_signed_in?

      @hide_header = true

      #flash[:error] = "Under Construction"
    else

      check_for_user_initialization

      @offer_category = OfferCategory.where(:home_page => true).last

      @offers = @offer_category.top_offers_for_user(current_user.id)

    end

  	
  end



  def offer_category_index

    if user_signed_in?

      check_for_user_initialization

    end

    @offer_category = OfferCategory.where(:url_slug => params[:category_url_slug]).last


    if personal_settings_object

      @personal_settings_object = personal_settings_object
      
    else


    end


    unless @offer_category

      redirect_to root_path

    end


  end

  def offer_category_type_index

    if user_signed_in?

      check_for_user_initialization

    end

    @offer_category = OfferCategory.where(:url_slug => params[:category_url_slug]).last

    @type = params[:type]

    @type = @type.capitalize

    if personal_settings_object

      @personal_settings_object = personal_settings_object
      
    else


    end

    unless @offer_category

      redirect_to root_path

    end

  end

  

  def signup

    @hide_header = true

  end

  def login

    @hide_header = true

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



  def personalize

    @hide_header = true

    if user_signed_in?

      check_for_user_initialization

    else

      flash[:error] = "Signup to Create an Account."
      redirect_to signup_path
    
    end


  end

  def enter_payment

    if user_signed_in?
    
      @hide_header = true
      
      if current_user.initiated_payment

        flash[:error] = "Payment already made."
        redirect_to root_path

      end

    else

      flash[:error] = "Signup to Create An Account"

      redirect_to signup_path

    end

  end



end
