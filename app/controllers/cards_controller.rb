class CardsController < ApplicationController

  get '/users/:user_id/cards' do
    @user = User.find_by_id(params[:user_id])
    @cards = @user.cards

    erb :'cards/users_index'
  end
end
