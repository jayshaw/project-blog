require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './functions.rb'

class TravelBlog < Sinatra::Base
  get "/" do
    erb :home
  end
  
  get "/view" do
    erb :blog_view
  end
  
  post "/save_attributes" do
      title = params[:title]
      image = params[:image]
      article_header = params[:article_h]
      article_body = params[:article_b]
      wiki_header = params[:wiki_h]
      wiki_body = params[:wiki_b]
  
      user = Visits.new({:title => title, :image => image, :article_h => article_header, :article_b => article_body, :wiki_h => wiki_header,
      :wiki_b => wiki_body})
      user.save # Saves the object to the database table.
      redirect to("/")
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