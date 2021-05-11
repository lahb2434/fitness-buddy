class WorkoutsController < ApplicationController

  
  # GET: /workouts/new
  get "/workouts/new" do
    if logged_in?
      @exercises = Exercise.all
      @muscles = Muscle.all
      erb :"/workouts/new.html"
    else
      flash[:message] = "Something went wrong, please login."
      redirect '/'
    end
  end

  # POST: /workouts
  post "/workouts" do
    
    if session[:routine_id] 
      routine = Routine.find(session[:routine_id])
      if !params[:workout].values.any?("")
        workout = Workout.new(params[:workout])
        workout.routine = routine
          if params[:exercise][:name].empty? && params[:muscle_id].empty?
            if !params[:exercise_id].empty?
              exercise = Exercise.find(params[:exercise_id])
            else
              flash[:message] = "Please fill in all areas to continue."
              redirect '/workouts/new'
            end
          else
            muscle = Muscle.find(params[:muscle_id])
            exercise = Exercise.new(params[:exercise])
            exercise.muscle = muscle
          end
      else
        flash[:message] = "Please fill in all areas to continue."
        redirect '/workouts/new'
      end
        workout.save
        exercise.exercise_workouts.build(workout: workout)
        exercise.save
        redirect "/routines/#{routine.id}"
    else
      flash[:message] = "Something went wrong."
      redirect "/programs/#{current_user.id}"
    end    
  end

  # GET: /workouts/5
  get "/workouts/:id" do
    if logged_in?
      erb :"/workouts/show.html"
    else
      flash[:message] = "Something went wrong, please login."
      redirect '/'
    end
  end

  # GET: /workouts/5/edit
  get "/workouts/:id/edit" do
    if logged_in?
      routine = Routine.find(session[:routine_id])
      @workout = Workout.find(params[:id])
      if @workout.routine.program.user == current_user
        @exercises = Exercise.all
        @muscles = Muscle.all
        erb :"/workouts/edit.html"
      else
        flash[:message] = "Something went wrong."
        redirect "/routine/#{routine.id}"
      end
    else
      flash[:message] = "Something went wrong, please login."
      redirect '/'
    end
  end

  # PATCH: /workouts/5
  patch "/workouts/:id" do
    routine = Routine.find(session[:routine_id])
    workout = Workout.find(params[:id])
    if !params[:workout].values.any?("")
      if params[:exercise][:name].empty? && params[:muscle_id].empty?
        if !params[:exercise_id].empty?
          workout.exercise_ids = [params[:exercise_id]]
        else
          flash[:message] = "Please fill in all areas to continue."
          redirect "/workouts/#{workout.id}/edit"
        end 
      else  
        muscle = Muscle.find(params[:muscle_id])
        exercise = Exercise.new(params[:exercise])
        exercise.muscle = muscle
        exercise.save
        workout.exercise_ids = [exercise.id]
        exercise.save
      end
      workout.update(params[:workout])
      workout.save
      redirect "/routines/#{routine.id}"
    else
      flash[:message] = "Please fill in all areas to continue."
      redirect "/workouts/#{workout.id}/edit"
    end
  end

  # DELETE: /workouts/5/delete
  delete "/workouts/:id/delete" do
    routine = Routine.find(session[:routine_id])
    workout = Workout.find(params[:id])
    if workout.routine.program.user == current_user
      workout.delete
      redirect "/routines/#{routine.id}"
    else
      flash[:message] = "Something went wrong."
      redirect "/workouts/#{workout.id}"
    end
  end
end
