class UsersController < ApplicationController

  get '/users' do
    @users = User.all

    erb :'users/index'
  end

  post '/users' do
    user = User.new(params)

    if user.save
      redirect "/users/#{user.id}"
    else
      redirect '/signup'
    end
  end

  get '/users/:id' do
    @user = User.find_by_id(params[:id])

    erb :'users/show'
  end

  get '/users/:id/edit' do
    @user = User.find_by_id(params[:id])
    erb :'users/edit'
  end

  get '/signup' do
    erb :'users/new'
  end
end
