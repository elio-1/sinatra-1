require 'gossip'
class ApplicationController < Sinatra::Base
  get '/' do                                  # index page, params value to the html
   erb :index, locals: {gossips: Gossip.all}
  end
  get '/gossips/new/' do
    erb :new_gossip
  end
  post '/gossips/new/' do              # gossips page, params value to the html for addin content to the csv file      
   Gossip.new(params["gossip_author"], params["gossip_content"]).save
   redirect '/'
  end
  
  get '/gossips/:id' do
    erb :show, locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)}
  end
  
   get '/gossips/:id/edit/' do
    erb :edit, locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)}
  end
  
end
