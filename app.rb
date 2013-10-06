require 'rubygems'
require 'sinatra/base'
require './models/client'

class MyApp < Sinatra::Base
  get '/' do
    @clients = Client.all(:order => [ :id.desc ], :limit => 20)
    erb :index
  end

  get '/form' do  
    erb :form  
  end 

  post '/form' do  
    Client.create(:first_name => params[:first], :last_name => params[:last], :copay_amount => params[:copay], :effective_as_of => params[:effective])
    redirect to('/')
  end
end

MyApp.run!
