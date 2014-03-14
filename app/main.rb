require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './functions.rb'

class TravelBlog < Sinatra::Base
  get "/" do
    erb :home
  end
  
  get "/australia" do
    erb :australia_trip
  end
  
  get "/new_zealand" do
    erb :new_zealand_trip
  end
  
  get "/thailand" do
    erb :thailand
  end
  
  post "/comments" do
    @comments = Comment.all
    erb :comments
    
    # redirect to("/#{params[:id]}")
  end
end