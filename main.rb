require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require_relative 'models/distance'

class App < Sinatra::Base
  
  get "/cost" do
    "Hello world! #{params}"
  end

  post "/distance" do
    "Hello world!"
  end
end