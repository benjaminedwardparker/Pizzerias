class PagesController < ApplicationController
  def show
    @pizza_joints = PizzaJoint.all
    @pizza_joint = PizzaJoint.new
  end

  def create
    @pizza_joint = PizzaJoint.new(params.require(:pizza_joint).permit(:name, :location))
    @pizza_joint.save
    redirect_to root_path
  end
end
