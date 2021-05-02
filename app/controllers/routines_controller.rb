class RoutinesController < ApplicationController

  # GET: /routines
  get "/routines" do
    erb :"/routines/index.html"
  end

  # GET: /routines/new
  get "/routines/new" do
    erb :"/routines/new.html"
  end

  # POST: /routines
  post "/routines" do
    program = Program.find(session[:program_id])
    program.routines.build(params[:routine])
    program.save
    routine = program.routines.last
    redirect "/routines/#{routine.id}"
  end

  # GET: /routines/5
  get "/routines/:id" do
    @program = Program.find(session[:program_id])
    @routine = Routine.find(params[:id])
    session[:routine_id] = @routine.id
    erb :"/routines/show.html"
  end

  # GET: /routines/5/edit
  get "/routines/:id/edit" do
    @routine = Routine.find(session[:routine_id])
    erb :"/routines/edit.html"
  end

  # PATCH: /routines/5
  patch "/routines/:id" do
    routine = Routine.find(params[:id])
    routine.update(params[:routine])
    redirect "/routines/#{routine.id}"
  end

  # DELETE: /routines/5/delete
  delete "/routines/:id/delete" do
    program = Program.find(session[:program_id])
    routine = Routine.find(params[:id])
    routine.workouts.destroy_all if !!routine.workouts
    routine.destroy
    redirect "/programs/#{program.slug}"
  end
end
