class ProgramsController < ApplicationController

  # GET: /programs
  get "/programs" do
    erb :"/programs/index.html"
  end

  # GET: /programs/new
  get "/programs/new" do 
    @programs = Program.all
    @user = User.find(session[:user_id])
    erb :"/programs/new.html"
  end

  get "/programs/new/:slug" do
    @program = Program.find_by_slug(params[:slug])
    @programs = Program.all
    @days = Day.all
    @exercises = Exercise.all
    @muscles = Muscle.all
    erb :"/programs/new-#{params[:slug]}.html"
  end

  # POST: /programs
  post "/programs" do
    redirect "/programs"
  end

  # GET: /programs/5
  get "/programs/:slug" do
    @user = session[:user_id]
    erb :"/programs/show.html"
  end

  # GET: /programs/5/edit
  get "/programs/:id/edit" do
    erb :"/programs/edit.html"
  end

  # PATCH: /programs/5
  patch "/programs/:id" do
    redirect "/programs/:id"
  end

  # DELETE: /programs/5/delete
  delete "/programs/:id/delete" do
    redirect "/programs"
  end
end
