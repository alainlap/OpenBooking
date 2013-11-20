class ProvidersController < ApplicationController
  before_action :set_provider, only: [:edit, :update, :destroy]
  before_filter :load_types, :set_user
  skip_before_filter :require_login, only: [:index]
  before_action :disallow_duplicate_providers, only: [:new]

  def index
    @providers = Provider.all
  end

  def new
    @provider = Provider.new
  end

  def edit
  end

  def create
    @provider = Provider.new(provider_params)
    @provider.user_id = current_user.id
    if @provider.save
      redirect_to user_path(@user), notice: 'Provider profile successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @provider.update(provider_params)
      redirect_to user_path(@user), notice: 'Provider was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @provider.destroy
    redirect_to user_path(@user)
  end

  private
    def set_provider
      @provider = Provider.find(params[:id])
    end

    def provider_params
      params.require(:provider).permit(:name, :address, :postal_code, :city, :province, :type_id, :description, :website, :phone_number)
    end

    def load_types
      @types = Type.all
    end

    def set_user
      @user = current_user
    end


    def disallow_duplicate_providers
      unless @user.provider.nil?
        redirect_to(user_path(@user), notice: "Error: You can only have one provider profile!")
      end
    end
end
