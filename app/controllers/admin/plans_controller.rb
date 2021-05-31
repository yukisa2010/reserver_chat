class Admin::PlansController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery :except => [:create]

  def show
    @user = User.find(params[:user_id])
    @plan = @user.plans.find(params[:id])
    if @user != current_user
      redirect_to user_plan_path(@user, @plan)
    end
  end

  def new
    @plan = current_user.plans.new
  end

  def create
    plan = current_user.plans.new(plan_params)
    if plan.save
      redirect_to admin_user_path(current_user), notice: 'Success!'
    else
      flash.now[:alert] = "Failed to create new"
      render new_admin_plan_path
    end
  end

  def edit
    @plan = current_user.plans.find(params[:id])
  end

  def update
    @plan = current_user.plans.find(params[:id])
    if @plan.update(plan_params)
      redirect_to admin_user_plan_path(current_user, @plan), notice: 'Success!'
    else
      flash.now[:alert] = @plan.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    plan = Plan.find(params[:id])
    if plan.destroy
      redirect_to admin_user_plan_path(current_user, plan), notice: 'Success to delete!'
    else
      flash.now[:alert] = 'Failed to delete'
      render request.referer
    end
  end

  private
    def plan_params
      params.require(:plan).permit(:plan_name, :description, :user_id)
    end

end
