class RoutinesController < ApplicationController


  # GET: /routines/new
  get "/routines/new" do
    if logged_in?
      erb :"/routines/new.html"
    else
      flash[:message] = "Something went wrong, please login."
      redirect '/'
    end
  end

  # POST: /routines
  post "/routines" do
    if session[:program_id]
      program = Program.find(session[:program_id])
      if !params[:routine][:routine_description].empty?
        program.routines.build(params[:routine])
        program.save
        routine = program.routines.last
        redirect "/routines/#{routine.id}"
      else
        flash[:message] = "Please fill in all areas to continue"
        redirect '/routines/new'
      end
    else
      flash[:message] = "Something went wrong."
      redirect '/programs'
    end
  end

  # GET: /routines/5
  get "/routines/:id" do
    if logged_in?
      @program = Program.find(session[:program_id])
      @routine = Routine.find(params[:id])
      if @program.routines.include?(@routine) && @program.user == current_user 
        
        session[:routine_id] = @routine.id
        erb :"/routines/show.html"
      else
        flash[:message] = "Something went wrong"
        redirect '/programs'
      end
    else
      flash[:message] = "Something went wrong, please login."
      redirect '/'
    end
  end

  # GET: /routines/5/edit
  get "/routines/:id/edit" do
    if logged_in? 
      @routine = Routine.find(params[:id])
      if @routine.program.user == current_user
        erb :"/routines/edit.html"
      else
        flash[:message] = "Something went wrong"
        redirect "/routines/#{@routine.id}"
      end
    else
      flash[:message] = "Something went wrong, please login."
      redirect '/'
    end
  end

  # PATCH: /routines/5
  patch "/routines/:id" do
    routine = Routine.find(params[:id])
    if !params[:routine][:routine_description].empty?
      routine.update(params[:routine])
      redirect "/routines/#{routine.id}"
    else
      flash[:message] = "Please fill in all areas to continue"
      redirect "/routines/#{routine.id}/edit"
    end
  end

  # DELETE: /routines/5/delete
  delete "/routines/:id/delete" do
    program = Program.find(session[:program_id])
    routine = Routine.find(params[:id])
    binding.pry
    if routine.program.user == current_user
      routine.workouts.destroy_all if !!routine.workouts
      routine.destroy
      redirect "/programs/#{program.slug}"
    else
      flash[:message] = "Something went wrong."
      redirect "/routines/#{routine.id}"
    end
  end

end
