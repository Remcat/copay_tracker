class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    if signed_in?
      @clients = Client.joins(:insurance_providers).where("insurance_providers.effective_on = (SELECT MAX(effective_on) FROM insurance_providers p group by client_id having p.client_id = insurance_providers.client_id) and user_id = ?", current_user.id).paginate(page: params[:page])
    else
      signed_in_user
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    if signed_in?
      @client = Client.new
      @client.insurance_providers.build
    else
      signed_in_user
    end
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    if signed_in?
      
      @client = Client.new(client_params)
      @client.user_id = current_user.id


      respond_to do |format|
        if @client.save
          format.html { redirect_to @client, notice: 'Client was successfully created.' }
          format.json { render action: 'show', status: :created, location: @client }
        else
          format.html { render action: 'new' }
          format.json { render json: @client.errors, status: :unprocessable_entity }
       end
      end
    else
      signed_in_user
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:first_name, :last_name, :copay, :effective_on, :user_id, insurance_providers_attributes: [:member_id, :name, :copay, :effective_on, :id])
    end
end
