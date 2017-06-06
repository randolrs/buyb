class PersonalSettingsController < ApplicationController
  
  def update_preferred_category

    if params[:category_id]

      @category = OfferCategory.find(params[:category_id])

      if @category

        if user_signed_in?

          personal_setting = PersonalSetting.where(:user_id => current_user.id).last

          unless personal_setting

            if session[:personal_setting_id]

              personal_setting = PersonalSetting.where(:session_id => session[:personal_setting_id]).last

              unless personal_setting

                personal_setting = PersonalSetting.create(:user_id => current_user.id)

              end

            else

              personal_setting = PersonalSetting.create(:user_id => current_user.id)

            end

          end

        else

          if session[:personal_setting_id]

            personal_setting = PersonalSetting.where(:id => session[:personal_setting_id]).last

            unless personal_setting

              personal_setting = PersonalSetting.create()

              session[:personal_setting_id] = personal_setting.id

            end

          else

            personal_setting = PersonalSetting.create()

            session[:personal_setting_id] = personal_setting.id

          end


        end

        personal_setting.update(:preferred_category_id => @category.id, :session_id => session.id)


        render json: { :result => "success", :personal_setting => personal_setting, :redirect_to_url => root_path, content_type: 'text/json' }

      else

        render json: { :result => "failure", content_type: 'text/json' }
      
      end

    else

      render json: { :result => "failure", content_type: 'text/json' }
      
    end

  end

end
