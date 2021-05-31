class Admin::PlansController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery :except => [:create]

  def show
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
  end

  private
    def plan_params
      params.require(:plan).permit(:plan_name, :description, :user_id)
    end

end
