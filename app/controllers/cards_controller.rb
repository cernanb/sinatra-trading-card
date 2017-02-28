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
end
