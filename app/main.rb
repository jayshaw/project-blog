require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative './functions.rb'

class WorldTravel < Sinatra::Base
  get "/" do  
    @visits = Visit.all
    erb :home
  end
  
 get "/entry" do
    erb :add_entry
  end
  
  post "/save_attributes" do
      country = params[:country]
      image = params[:image]
      article_h = params[:article_h]
      article_b = params[:article_b]
      visit = Visit.new({:country => country, :image => image, :article_h => article_h, :article_b => article_b})
      visit.save # Saves the object to the database table.
      redirect to("/")
  end
end