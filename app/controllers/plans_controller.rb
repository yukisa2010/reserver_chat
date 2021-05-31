class PlansController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
    @user = User.find_by(params[:user_id])
    @plan = Plan.find(params[:id])
    if @user == current_user
      redirect_to admin_user_plan_path(@user, @plan)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
