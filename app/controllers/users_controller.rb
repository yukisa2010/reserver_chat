class UsersController < ApplicationController

  def index
    @users = User.where.not(id: current_user)
  end

  def show
    @user = User.find(params[:id])
    if @user == current_user
      redirect_to admin_user_plan_path(current_user)
    end
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
