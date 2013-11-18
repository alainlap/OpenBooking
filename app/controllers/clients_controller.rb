class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  before_action :disallow_duplicate_clients, only: [:new]


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
      redirect_to user_path(@user), notice: 'Client was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @client.update(client_params)
      redirect_to user_path(@user), notice: 'Client was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @client.destroy
      redirect_to user_path(@user)
  end

  private

    def set_client
      @client = Client.find(params[:id])
    end


    def client_params
      params.require(:client).permit(:name, :address, :postal_code, :city, :province, :phone_number)
    end

    def set_user
      @user = current_user
    end

    def disallow_duplicate_clients
      unless @user.client.nil?
        redirect_to(user_path(@user), notice: "Error: You can only have one client profile!")
      end
    end
end
