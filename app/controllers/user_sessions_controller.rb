class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:username], params[:password], params[:remember])
      redirect_to(user_path(@user), flash: {success: 'Login successful'})
    else
      redirect_to(:providers, alert: 'Login failed')
    end
  end

  def destroy
    logout
    redirect_to(root_path, flash: {success: 'Logged out!'})
  end
end 