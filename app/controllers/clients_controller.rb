class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @clients = Client.all
  end

  def show
  end

  def new
    @client = Client.new
  end

  def edit
  end

  def create
    @client = Client.new(client_params)
    @client.user_id = current_user.id

    if @client.save
      redirect_to @client, notice: 'Client was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @client.update(client_params)
      redirect_to @client, notice: 'Client was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @client.destroy
      redirect_to clients_url
  end

  private

    def set_client
      @client = Client.find(params[:id])
    end


    def client_params
      params.require(:client).permit(:name, :address, :postal_code, :city, :province, :phone_number)
    end
end
