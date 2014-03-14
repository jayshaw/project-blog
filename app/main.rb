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
  
  get "/australia" do
    erb :australia
  end
  
  get "/new_zealand" do
    erb :new_zealand
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