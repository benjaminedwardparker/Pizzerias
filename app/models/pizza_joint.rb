class PizzaJoint < ActiveRecord::Base
  geocoded_by :location, :latitude => :lat, :longitude => :lng
  after_validation :geocode, if: ->(obj){ obj.lat.nil? }
end
