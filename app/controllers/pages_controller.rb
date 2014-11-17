class PagesController < ApplicationController
  def show
    @pizza_joints = PizzaJoint.all
  end
end
