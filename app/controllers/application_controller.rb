require 'rack-flash'
require 'securerandom'


class ApplicationController < Sinatra::Base
  enable :sessions
  set :session_secret, ENV.fetch('SESSION_SECRET'){SecureRandom.hex(64)}
  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end 

  get "/" do
    erb :welcome
  end

  post '/' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
     session[:user_id] = user.id
     redirect '/users'
    else
      flash[:message] = "Incorrect Username or Password. Please try again"
     redirect to '/' 
    end
  end

  get '/signup' do 
    if !!session[:user_id]
      @user = Helpers.current_user(session)
      redirect "/users/#{@user.slug}"
    else
      erb :signup
    end
  end
  

  post '/signup' do
    user = User.find_by(username: params[:username])
    if user 
      flash[:message] = "Username already taken, select different Username."
      redirect "/signup"
    else
      user = User.new(username: params[:username], password: params[:password])
      if user.save
        session[:user_id] = user.id
        redirect '/users/new'
      else
        flash[:message] = "ENTER A USERNAME & PASSWORD TO CONTINUE"
        redirect "/signup"
      end
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end

