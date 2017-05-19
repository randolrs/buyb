class PartnershipApplicationsController < ApplicationController
  before_action :set_partnership_application, only: [:show, :edit, :update, :destroy]

  # GET /partnership_applications
  # GET /partnership_applications.json
  def index
    @partnership_applications = PartnershipApplication.all
  end

  # GET /partnership_applications/1
  # GET /partnership_applications/1.json
  def show
  end

  # GET /partnership_applications/new
  def new
    @partnership_application = PartnershipApplication.new
  end

  # GET /partnership_applications/1/edit
  def edit
  end

  # POST /partnership_applications
  # POST /partnership_applications.json
  def create
    @partnership_application = PartnershipApplication.new(partnership_application_params)

    respond_to do |format|
      if @partnership_application.save
        format.html { redirect_to root_path }
        format.json { render :show, status: :created, location: @partnership_application }
      else
        format.html { render :new }
        format.json { render json: @partnership_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /partnership_applications/1
  # PATCH/PUT /partnership_applications/1.json
  def update
    respond_to do |format|
      if @partnership_application.update(partnership_application_params)
        format.html { redirect_to @partnership_application, notice: 'Partnership application was successfully updated.' }
        format.json { render :show, status: :ok, location: @partnership_application }
      else
        format.html { render :edit }
        format.json { render json: @partnership_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partnership_applications/1
  # DELETE /partnership_applications/1.json
  def destroy
    @partnership_application.destroy
    respond_to do |format|
      format.html { redirect_to partnership_applications_url, notice: 'Partnership application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partnership_application
      @partnership_application = PartnershipApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def partnership_application_params
      params.require(:partnership_application).permit(:company_name, :company_description, :contact_email, :contact_name, :company_url, :product_name, :product_description, :product_why_is_great, :customer_service_staff, :contact_title)
    end
end
