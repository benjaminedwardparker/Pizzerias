require 'faraday'
require 'faker'
require 'active_support/all'

conn = Faraday.new(:url => 'http://localhost:3000')
# conn = Faraday.new(:url => 'http://pizzerias.herokuapp.com')
10.times do

  city = ["Conroe, TX", "Katy, TX", "Pearland, TX", "Woodlands, TX", "Sugar Land, TX", "Baytown, TX",
          "Pasadena, TX", "La Porte, TX", "Friendswood, TX", "Texas City, TX", "Galveston, TX",
          "Highlands, TX", "Bunker Hill, TX", "Rosenberg, TX", "Missouri City, TX",
          "Deer Park, TX", "Bellaire, TX", "Alvin, TX", "Tomball, TX", "South Houston, TX",
          "Freeport, TX", "Dickinson, TX", "Clute, TX", "Richmond, TX", "Stafford, TX",
          "La Marque, TX", "Webster, TX", "Seabrook, TX", "Santa Fe, TX", "Humble, TX",
          "Aldine, TX", "Cinco Ranch, TX", "Fresno, TX", "Anahuac, TX", "Weimar, TX",
          "Columbus, TX", "Brenham, TX", "East Bernard, TX", "El Campo, TX",
          "Liberty, TX", "Lumberton, TX", "Cypress, TX", "Magnolia, TX", "Spring, TX",
          "Beaumont, TX", "Needville, TX", "Wharton, TX", "Sealy, TX", "Bellville, TX",
          "Hempstead, TX", "Roman Forest, TX", "Cleveland, TX", "La Grange, TX"].sample

  pizza_joint_name = [Faker::Company.name, "Pizza"].join(" ")

  response = conn.post do |req|
    req.url '/api/pizza_joints.json'
    req.headers['Content-Type'] = 'application/json'
    req.body = {
      pizza_joint: {
        name: pizza_joint_name,
        location: city
      }
    }.deep_stringify_keys.to_json
  end

end
