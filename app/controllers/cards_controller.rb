class CardsController < ApplicationController

  get '/users/:user_id/cards' do
    if logged_in?
        
      @user = User.find_by_id(params[:user_id])
      @cards = @user.cards
      erb :'cards/users_index'
    else
      redirect '/login'
    end
  end
    
    get '/cards/new' do
        erb :'cards/new'
    end
    
    post '/cards' do
        if logged_in?
            
            current_user.cards.find_or_create_by(player: params[:player], team: params[:team], year: params[:year])
        end
        redirect '/users/'+String(current_user.id)+'/cards'
    end
end
