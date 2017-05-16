class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.all
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
  end


  def show_formatted

    @email_cta = true

    if params[:name_url_slug]

      @offer = Offer.where(:name_url_slug => params[:name_url_slug]).last

      unless @offer

        redirect_to root_path

      end

    else

      redirect_to root_path

    end


  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  # POST /offers.json
  def create
    
    @offer = Offer.new(offer_params)

    respond_to do |format|
      
      if @offer.save

        if @offer.name

          original_slug = @offer.name.downcase.gsub(' ', '-')

          slug = original_slug

          c=0
          i=1

          until c==1 do

            unless Offer.where(:name_url_slug => slug).exists?

              @offer.update(:name_url_slug => slug)

              c=1

              else

              i = i + 1

              slug = original_slug + "-" + i.to_s

            end

          end

        end

        format.html { redirect_to @offer, notice: 'Offer was successfully created.' }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:headline, :sub_headline, :content, :bootsy_image_gallery_id, :name, :name_url_slug, :price)
    end
end
