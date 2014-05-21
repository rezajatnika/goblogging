class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy, :update]
  before_filter :require_logout, only: [:new, :create]

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1/edit
  def edit; end

  # GET /users/1
  def show; end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'Check your email for account activation.'
    else
      render 'new'
    end
  end

  # PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Profile has been updated!'
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to root_path, notice: 'Account deleted!'
  end

  private

  # Callback for @user, before_action method
  def set_user
    @user = User.find(params[:id])
  end

  # Strong params
  def user_params
    user_attr = [:email, :password, :password_confirmation, :first_name, :last_name]
    params.require(:user).permit(*user_attr)
  end
end
