class PersonalSettingsController < ApplicationController
  
  def update_preferred_category

    if params[:category_id]

      @category = OfferCategory.find(params[:category_id])

      if @category

        render json: { :result => "success", content_type: 'text/json' }

      else

        render json: { :result => "failure", content_type: 'text/json' }
      
      end

    else

      render json: { :result => "failure", content_type: 'text/json' }
      
    end

  end

  def update_how_much

    if params[:category_id]

      @category = OfferCategory.find(params[:category_id])

      if @category

        render json: { :result => "success", content_type: 'text/json' }

      else

        render json: { :result => "failure", content_type: 'text/json' }
      
      end

    else

      render json: { :result => "failure", content_type: 'text/json' }
      
    end

  end


end
