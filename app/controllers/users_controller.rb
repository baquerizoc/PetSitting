class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update!(user_params)
  		render :show, notice: 'User was successfully updated'
  	else
  		render :edit
  	end
  end

  def new	
  end
  
  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
  	params.require(:user).permit(:name, :lastname, :date_of_birth, :phone, :address)
  end
end
