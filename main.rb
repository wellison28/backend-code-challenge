require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require_relative 'models/distance'
require_relative 'lib/diikstra/edge'
require_relative 'lib/diikstra/graph'
require_relative 'lib/services/utils'

class App < Sinatra::Base
  before do
    content_type 'application/json'
  end

  get "/cost" do
    distance = Service::get_lowest_path(params)
    if Service::valid_params?(params)
      if distance.nil?
        status 404
        {messsage: "Path not exists!"}
      else
        status 201
        Service::calculate_cost(distance, params) 
      end
    else
      status 400
      {message: "Weight value invalid!"}
    end    
  end

  post "/distance" do
    params = request.body.read
    origin, destination, distance = Service::parse_values(params)
    saved_result = Service::save_values(origin, destination, distance)

    if saved_result
      status 200
      { message: 'Distance created with success!' }.to_json
    else
      status 400
      { message: 'Error on create or update distance!' }.to_json
    end
  end
end