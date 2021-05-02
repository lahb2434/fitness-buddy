class ProgramsController < ApplicationController

  # GET: /programs
  get "/programs" do
    if !!session[:user_id]
      @user = Helpers.current_user(session)
      @programs = @user.programs
      erb :"/programs/index.html"
    else
      redirect "/"
    end
  end

  # GET: /programs/new
  get "/programs/new" do 
    @user = Helpers.current_user(session)
    erb :"/programs/new.html"
  end


  # POST: /programs
  post "/programs" do
    user = Helpers.current_user(session)
    user.programs.create(params[:program])
    program = user.programs.last
    redirect "/programs/#{program.slug}"
  end

  
  get "/programs/:slug" do
    @program = Program.find_by_slug(params[:slug])
    session[:program_id] = @program.id
    erb :"/programs/show.html"
  end

  
  get "/programs/:slug/edit" do
    @program = Program.find_by_slug(params[:slug])
    erb :"/programs/edit.html"
  end

  
  patch "/programs/:slug" do
    program = Program.find_by_slug(params[:slug])
    program.update(params[:program])
    redirect "/programs/#{program.slug}"
  end

  # DELETE: /programs/5/delete
  delete "/programs/:slug/delete" do
    program = Program.find_by_slug(params[:slug])
    if program.routines.each do |routine|
         routine.workouts.destroy_all if !!routine.workouts
       end
       program.routines.destroy_all
    end
    program.destroy
    redirect "/programs"
  end
end
