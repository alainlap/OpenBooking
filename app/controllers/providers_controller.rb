class ProvidersController < ApplicationController
  before_action :set_provider, only: [:edit, :update, :destroy]
  before_filter :load_types, :set_user
  skip_before_filter :require_login, only: [:index]
  before_action :disallow_duplicate_providers, only: [:new]

  def index

    ignore_type = Type.new({id: 0, name: "ALL TYPES"})
    @types.unshift(ignore_type)

    #use live filter
    if params[:filter] &&                                       #The user has searched
      filter_params[:filter].present? &&                        #The search field isn't empty
      Provider.column_names.include?(filter_params[:property])  #The property is ok for interpolation

        if filter_params[:type].to_i == 0
          @providers = Provider.where("#{filter_params[:property]} ilike ?", "%#{filter_params[:filter]}%").order('providers.name ASC').load
        elsif (1..( @types.length - 1 )).include?(filter_params[:type].to_i)
          @providers = Provider.where("#{filter_params[:property]} ilike ? AND type_id = ?", "%#{filter_params[:filter]}%", filter_params[:type]).order('providers.name ASC').load
        end

        respond_to do |format|
          format.js { render 'filter' }
        end

    #display all providers
    else
      @providers = Provider.order('name ASC').page(params[:page])
      respond_to do |format|
        format.js
        format.html
      end
    end
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

      Availability.initializer(@provider.id)

      redirect_to user_path(@user), flash: { success: 'Provider profile successfully created.' }
    else
      render action: 'new'
    end
  end

  def update
    if @provider.update(provider_params)
      redirect_to user_path(@user), flash: { success: 'Provider profile successfully updated.' }
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

    def filter_params
      params.require(:filter).permit(:filter, :property, :type)
    end

    def load_types
      @types = Type.all
    end

    def set_user
      @user = current_user
    end

    def disallow_duplicate_providers
      unless @user.provider.nil?
        redirect_to(user_path(@user), alert: "Error: You can only have one provider profile!")
      end
    end

end
