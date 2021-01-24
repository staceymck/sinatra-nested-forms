require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/' do
      erb :root
    end
    
    post '/pirates' do
      @pirate = Pirate.new(params[:pirate]) #create a pirate instance variable
      
      params[:pirate][:ships].each do |ship_details| #create one or more instances of Ships class
        Ship.new(ship_details)
      end

      @ships = Ship.all

      erb :'pirates/show'
    end
    
    get '/new' do
      erb :'pirates/new'
    end
  end
end
