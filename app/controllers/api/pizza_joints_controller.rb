class Api::PizzaJointsController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    @pizza_joints = PizzaJoint.all
    render json: @pizza_joints
  end
  def create
    @pizza_joint = PizzaJoint.new(params.require(:pizza_joint).permit(:name,:location,:lat,:lng))
    @pizza_joint.save
    render json: @pizza_joint
  end

  def update
    @pizza_joint = PizzaJoint.find(params[:id])
    @pizza_joint.update(params.require(:pizza_joint).permit(:name,:location,:lat,:lng))
    render json: @pizza_joint
  end
end
