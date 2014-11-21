class PagesController < ApplicationController
  def show
    @pizza_joints = PizzaJoint.all
    @pizza_joint = PizzaJoint.new
  end

  def create
    
  end
end
