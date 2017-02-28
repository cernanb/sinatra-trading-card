class UsersController < ApplicationController

  get '/users' do
    @users = User.all
    if logged_in?
      erb :'users/index'
    else
      redirect '/login'
    end
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
    binding.pry
    if logged_in?
      erb :'users/show'
    else
      redirect '/login'
    end
  end

  get '/users/:id/edit' do
    if logged_in?
    @user = User.find_by_id(params[:id])
    erb :'users/edit'
    else
      redirect '/login'
    end
  end

  post '/users/:id' do

    @user = User.find_by_id(params[:id])
    @user.update(username: params[:username], first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
    if params[:password] != ""
      @user.update(password: params[:password])
    end
    redirect "/users/#{@user.id}"
  end

  get '/signup' do
    erb :'users/new'
  end
end
