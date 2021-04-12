class ExersiseMusclesController < ApplicationController

  # GET: /exersise_muscles
  get "/exersise_muscles" do
    erb :"/exersise_muscles/index.html"
  end

  # GET: /exersise_muscles/new
  get "/exersise_muscles/new" do
    erb :"/exersise_muscles/new.html"
  end

  # POST: /exersise_muscles
  post "/exersise_muscles" do
    redirect "/exersise_muscles"
  end

  # GET: /exersise_muscles/5
  get "/exersise_muscles/:id" do
    erb :"/exersise_muscles/show.html"
  end

  # GET: /exersise_muscles/5/edit
  get "/exersise_muscles/:id/edit" do
    erb :"/exersise_muscles/edit.html"
  end

  # PATCH: /exersise_muscles/5
  patch "/exersise_muscles/:id" do
    redirect "/exersise_muscles/:id"
  end

  # DELETE: /exersise_muscles/5/delete
  delete "/exersise_muscles/:id/delete" do
    redirect "/exersise_muscles"
  end
end
