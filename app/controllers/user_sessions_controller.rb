class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:username], params[:password], params[:remember])
      redirect_back_or_to(user_path(@user), notice: 'Login successful')
    else
      redirect_to(:providers, notice: 'Login failed')
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end
end 