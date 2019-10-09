require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

class App < Sinatra::Base
  get "/" do
    "Hello world!"
  end
end