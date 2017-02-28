require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "trading_card_secret"
  end

  get "/" do
    erb :welcome
  end

  helpers do


    def logged_in?
      binding.pry
      !!current_user
    end

    def current_user
        # memoization
        @current_user ||= User.find(session[:user_id]) if session[:user_id] != nil
    end

    def if_not_logged_in_go_home?
        redirect to '/' if !logged_in?
    end

  end

end
