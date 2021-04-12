class MusclesController < ApplicationController

  # GET: /muscles
  get "/muscles" do
    erb :"/muscles/index.html"
  end

  # GET: /muscles/new
  get "/muscles/new" do
    erb :"/muscles/new.html"
  end

  # POST: /muscles
  post "/muscles" do
    redirect "/muscles"
  end

  # GET: /muscles/5
  get "/muscles/:id" do
    erb :"/muscles/show.html"
  end

  # GET: /muscles/5/edit
  get "/muscles/:id/edit" do
    erb :"/muscles/edit.html"
  end

  # PATCH: /muscles/5
  patch "/muscles/:id" do
    redirect "/muscles/:id"
  end

  # DELETE: /muscles/5/delete
  delete "/muscles/:id/delete" do
    redirect "/muscles"
  end
end
