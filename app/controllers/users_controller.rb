class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @users = User.where.not(id: current_user)
  end

  def show
    @user = User.find(params[:id])
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
