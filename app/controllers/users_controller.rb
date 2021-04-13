class UsersController < ApplicationController
  
  
  # GET: /users
  
  get "/users" do
    @user = User.find(session[:user_id])
    erb :"/users/index.html"
  end

  # GET: /users/new
  get "/users/new" do
    erb :"/users/new.html"
  end

  # POST: /users
  post '/users' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
     session[:user_id] = user.id
     redirect '/users'
    else
      flash[:message] = "Incorrect Username or Password. Please try again"
     redirect to '/' 
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
