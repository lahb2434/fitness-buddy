class UsersController < ApplicationController
  
  
  # GET: /users
  
  get "/users" do
    if session[:user_id]
      @user = Helpers.current_user(session)
      erb :"/users/show.html"
    else
      flash[:message] = "Something went wrong, please login."
      redirect '/'
    end
  end

  # GET: /users/new
  get "/users/new" do
    @user = Helpers.current_user(session)
    erb :"/users/new.html"
  end

  # POST: /users
  post '/users' do
    user = Helpers.current_user(session)
    user.update(params[:user])
    redirect "/users/#{user.slug}"
  end

  # GET: /users/5
  get "/users/:slug" do
    @user = Helpers.current_user(session)
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:slug/edit" do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      erb :"/users/edit.html"
    else
    redirect "/"
    end
  end

  # PATCH: /users/5
  patch "/users/:slug" do
    if User.find(session[:user_id]) == User.find_by_slug(params[:slug])
      user = User.find_by_slug(params[:slug])
      user.update(params[:user])
      redirect "/users/:slug"
    else
      redirect "/"
    end
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
