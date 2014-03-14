require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './functions'

class TravelBlog < Sinatra::Base
  get "/" do
    @visits = Visit.all
  
    erb :home
  end
end