class UsersController < ApplicationController
  
  
  # GET: /users
  
  get "/users" do
    @programs = Program.all
    if session[:user_id]
      @user = User.find(session[:user_id])
      erb :"/users/show.html"
    else
      flash[:message] = "Something went wrong, please login."
      redirect '/'
    end
  end

  # GET: /users/new
  get "/users/new" do
    erb :"/users/new.html"
  end

  # POST: /users
  post '/users' do
    user = User.new(username: params[:username], password: params[:password])
    if user.save
      session[:user_id] = user.id
      redirect '/users'
    else
      flash[:message] = "ENTER A USERNAME & PASSWORD TO CONTINUE"
      redirect "/signup"
    end
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
