class SessionsController < ApplicationController
  # GET /sessions/new
  def new
    @user = User.new
  end

  # POST /sessions
  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to root_path, notice: 'Logged in!'
    else
      flash.now[:alert] = 'Invalid email or password.'
      render 'new'
    end
  end

  # DELETE /sessions
  def destroy
    logout
    redirect_to root_path, notice: 'Logged out!'
  end
end
