class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #before_action :check_for_user_initialization, if: proc { user_signed_in? }


  if Rails.env == "production"
  
    Stripe.api_key = ENV['STRIPE_LIVE_SECRET_KEY']

  else

    Stripe.api_key = ENV['STRIPE_TEST_SECRET_KEY']

  end


  def after_sign_in_path_for(user)

    if current_user.id
        
      if current_user.initiated_payment
        
        if current_user.personalized  
        
          root_path
        
        else

          personalize_path
        end
      
      else

        enter_payment_path

      end

    else

      flash[:error] = "Error Logging In"
      root_path
      
    end



  end


  def check_for_user_initialization
        
    if current_user.initiated_payment
      
      if current_user.personalized  
        
        unless request.path == root_path
          redirect_to root_path
        end
      
      else

        unless request.path == personalize_path
          redirect_to personalize_path
        end

      end
    
    else
      
      unless request.path == enter_payment_path
        redirect_to enter_payment_path
      end

    end

  end

  
  def personal_settings_object

    if user_signed_in?
      
      if current_user.personal_settings

        return current_user.personal_settings

      else

        session_settings = PersonalSetting.where(:session_id => session.id).last

        if session_settings

          return session_settings

        else

          return nil

        end

      end

    else

      session_settings = PersonalSetting.where(:session_id => session.id).last

      if session_settings

        return session_settings

      else

        return nil

      end

    end

  end

  # before_filter :ensure_signup_complete, only: [:new, :create, :update, :destroy]




  # def ensure_signup_complete
  #   # Ensure we don't go into an infinite loop
  #   return if action_name == 'finish_signup'

  #   # Redirect to the 'finish_signup' page if the user
  #   # email hasn't been verified yet
  #   if current_user && !current_user.email_verified?
  #     redirect_to finish_signup_path(current_user)
  #   end
  # end

end
