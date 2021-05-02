class WorkoutsController < ApplicationController

  # GET: /workouts
  get "/workouts" do
    erb :"/workouts/index.html"
  end

  # GET: /workouts/new
  get "/workouts/new" do
    @exercises = Exercise.all
    @muscles = Muscle.all
    erb :"/workouts/new.html"
  end

  # POST: /workouts
  post "/workouts" do
    routine = Routine.find(session[:routine_id])
    workout = Workout.new(params[:workout])
    workout.routine = routine
    workout.save
    if params[:exercise][:name].empty?
      exercise = Exercise.find(params[:exercise_id])
    else
      muscle = Muscle.find(params[:muscle_id])
      exercise = Exercise.new(params[:exercise])
      exercise.muscle = muscle
    end
    exercise.exercise_workouts.build(workout: workout)
    exercise.save
    redirect "/routines/#{routine.id}"
  end

  # GET: /workouts/5
  get "/workouts/:id" do
    erb :"/workouts/show.html"
  end

  # GET: /workouts/5/edit
  get "/workouts/:id/edit" do
    @workout = Workout.find(params[:id])
    @exercises = Exercise.all
    erb :"/workouts/edit.html"
  end

  # PATCH: /workouts/5
  patch "/workouts/:id" do
    routine = Routine.find(session[:routine_id])
    workout = Workout.find(params[:id])
    workout.update(params[:workout])
    
    if params[:exercise][:name].empty?
      workout.exercise_ids = [params[:exercise_id]]
    else  
      muscle = Muscle.find(params[:muscle_id])
      exercise = Exercise.new(params[:exercise])
      exercise.muscle = muscle
      exercise.save
      workout.exercise_ids = [exercise.id]
      exercise.save
    end
    workout.save
    redirect "/routines/#{routine.id}"
  end

  # DELETE: /workouts/5/delete
  delete "/workouts/:id/delete" do
    routine = Routine.find(session[:routine_id])
    workout = Workout.find(params[:id])
    workout.delete
    redirect "/routines/#{routine.id}"
  end
end
