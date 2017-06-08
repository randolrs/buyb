class PersonalSettingsController < ApplicationController
  
  def update_preferred_category

    if params[:category_id]

      @category = OfferCategory.find(params[:category_id])

      if @category

        if personal_settings_object

          personal_setting = personal_settings_object

        else

          if user_signed_in?
          
            personal_setting = PersonalSetting.create(:user_id => current_user.id)
          
          else

            personal_setting = PersonalSetting.create()

            session[:personal_setting_id] = personal_setting.id


          end

        end

        personal_setting.update(:preferred_category_id => @category.id, :session_id => session.id)


        render json: { :result => "success", :personal_setting => personal_setting, :redirect_to_url => nil, content_type: 'text/json' }


      else

        render json: { :result => "failure", content_type: 'text/json' }
      
      end

    else

      render json: { :result => "failure", content_type: 'text/json' }
      
    end

  end

  def update_biggest_problem

    if params[:biggest_problem_id]

      if personal_settings_object

        personal_setting = personal_settings_object

      else

        if user_signed_in?
        
          personal_setting = PersonalSetting.create(:user_id => current_user.id)
        
        else

          personal_setting = PersonalSetting.create()

          session[:personal_setting_id] = personal_setting.id


        end

      end

      personal_setting.update(:biggest_problem_id => params[:biggest_problem_id], :session_id => session.id)


      render json: { :result => "success", :personal_setting => personal_setting, :redirect_to_url => root_path, content_type: 'text/json' }

    else

      render json: { :result => "failure", :personal_setting => nil, :redirect_to_url => root_path, content_type: 'text/json' }

    end

  end

  def update_how_much

    if params[:how_much]

      if personal_settings_object

        personal_setting = personal_settings_object

      else

        if user_signed_in?
        
          personal_setting = PersonalSetting.create(:user_id => current_user.id)
        
        else

          personal_setting = PersonalSetting.create()

          session[:personal_setting_id] = personal_setting.id


        end

      end

      if params[:how_much] == "true"
        
        personal_setting.update(:made_money => true, :session_id => session.id)

      else

        personal_setting.update(:made_money => false, :session_id => session.id)


      end

      render json: { :result => "success", :personal_setting => personal_setting, :redirect_to_url => nil, content_type: 'text/json' }

    else

      render json: { :result => "failure", :personal_setting => nil, :redirect_to_url => nil, content_type: 'text/json' }

    end

  end

  def skip_personal_settings

    session[:skip_personal_settings] = true


    render json: {:result => "success", :redirect_to_url => nil, content_type: 'text/json' }


  end

end
