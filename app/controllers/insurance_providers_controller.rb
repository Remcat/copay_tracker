class InsuranceProvidersController < ApplicationController
  before_action :set_insurance_provider, only: [:show, :edit, :update, :destroy]

  # GET /insurance_providers
  # GET /insurance_providers.json
  def index
    @insurance_providers = InsuranceProvider.joins(:client).where('user_id = ?', current_user.id).order('client_id DESC')
  end

  # GET /insurance_providers/1
  # GET /insurance_providers/1.json
  def show
  end

  # GET /insurance_providers/new
  def new
    @insurance_provider = InsuranceProvider.new
  end

  # GET /insurance_providers/1/edit
  def edit
  end

  # POST /insurance_providers
  # POST /insurance_providers.json
  def create
    @insurance_provider = InsuranceProvider.new(insurance_provider_params)

    respond_to do |format|
      if @insurance_provider.save
        format.html { redirect_to @insurance_provider, notice: 'Insurance provider was successfully created.' }
        format.json { render action: 'show', status: :created, location: @insurance_provider }
      else
        format.html { render action: 'new' }
        format.json { render json: @insurance_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /insurance_providers/1
  # PATCH/PUT /insurance_providers/1.json
  def update
    respond_to do |format|
      if @insurance_provider.update(insurance_provider_params)
        format.html { redirect_to @insurance_provider, notice: 'Insurance provider was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @insurance_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insurance_providers/1
  # DELETE /insurance_providers/1.json
  def destroy
    @insurance_provider.destroy
    respond_to do |format|
      format.html { redirect_to insurance_providers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insurance_provider
      @insurance_provider = InsuranceProvider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def insurance_provider_params
      params[:insurance_provider].permit(:client_id, :name, :member_id, :copay, :effective_on)
    end
end
