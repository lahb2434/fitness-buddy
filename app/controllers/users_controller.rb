class UsersController < ApplicationController
  
  get "/users/new" do
    if logged_in?
      @user = current_user
      erb :"/users/new.html"
    else
      flash[:message] = "Something went wrong, please login."
      redirect '/'
    end
  end

  # POST: /users
  post '/users' do
    user = current_user
    user.update(params[:user])
    redirect "/users/#{user.slug}"
  end

  # GET: /users/5
  get "/users/:slug" do
    if logged_in?
      @user = current_user
      erb :"/users/show.html"
    else
      flash[:message] = "Something went wrong, please login."
      redirect '/'
    end
  end

  # GET: /users/5/edit
  get "/users/:slug/edit" do
    if logged_in? 
      @user = User.find_by_slug(params[:slug])
      if @user == current_user
        erb :"/users/edit.html"
      else
        user = current_user
        flash[:message] = "Something went wrong"
        redirect "users/#{user.slug}"
      end
    else
        flash[:message] = "Something went wrong, please login"
        redirect "/"
    end
  end

  # PATCH: /users/5
  patch "/users/:slug" do
    if current_user == User.find_by_slug(params[:slug])
      user = User.find_by_slug(params[:slug])
      user.update(params[:user])
      redirect "/users/{#{user.slug}"
    else
      flash[:message] = "Something went wrong, please login."
      redirect "/"
    end
  end

end