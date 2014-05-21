class SessionsController < ApplicationController
  before_filter :require_logout, only: [:new, :create]

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
      redirect_to root_path, alert: 'Invalid email or password. Please check again.'
    end
  end

  # DELETE /sessions
  def destroy
    logout
    redirect_to root_path, notice: 'Logged out!'
  end
end
