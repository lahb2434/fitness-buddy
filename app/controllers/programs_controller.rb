class ProgramsController < ApplicationController

  # GET: /programs
  get "/programs" do
    erb :"/programs/index.html"
  end

  # GET: /programs/new
  get "/programs/new" do
    erb :"/programs/new.html"
  end

  # POST: /programs
  post "/programs" do
    redirect "/programs"
  end

  # GET: /programs/5
  get "/programs/:id" do
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
