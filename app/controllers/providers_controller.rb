class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :destroy]
  before_filter :load_types
  skip_before_filter :require_login, only: [:index, :show]

  def index
    @providers = Provider.all
  end

  def show
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
      redirect_to @provider, notice: 'Provider was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @provider.update(provider_params)
      redirect_to @provider, notice: 'Provider was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @provider.destroy
    redirect_to providers_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_params
      params.require(:provider).permit(:name, :address, :postal_code, :city, :province, :type_id, :description, :website, :phone_number)
    end

    def load_types
      @types = Type.all
    end
end
