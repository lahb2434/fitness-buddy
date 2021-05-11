class ProgramsController < ApplicationController

 
  get "/programs" do
    if logged_in?
      @user = current_user
      @programs = @user.programs
      erb :"/programs/index.html"
    else
      redirect "/"
    end
  end

  # GET: /programs/new
  get "/programs/new" do 
    if logged_in?
      @user = current_user
      erb :"/programs/new.html"
    else
      redirect '/'
    end
  end


  # POST: /programs
  post "/programs" do
    user = current_user
    if params[:program][:name]
      user.programs.create(params[:program])
      program = user.programs.last
      redirect "/programs/#{program.slug}"
    else
      flash[:message] = "Please fill in all areas to continue."
      redirect '/programs/new'
    end
  end

  
  get "/programs/:slug" do
    if logged_in?
      @program = find_by_slug
      if current_user.programs.include?(@program)
        session[:program_id] = @program.id
      else
        flash[:message] = "Something went wrong"
        redirect "/programs/#{@program.slug}"
      end
      erb :"/programs/show.html"
    else
      flash[:message] = "Something went wrong, please login."
      redirect '/'
    end
  end

  
  get "/programs/:slug/edit" do
    if logged_in?
      @program = find_by_slug
      if current_user.programs.include?(@program)
        erb :"/programs/edit.html"
      else
        flash[:message] = "Something went wrong"
        redirect "/programs/#{@program.slug}"
      end
    else
      flash[:message] = "Something went wrong, please login."
      redirect '/'
    end
  end
    

  patch "/programs/:slug" do
    program = find_by_slug
    if !params[:program][:name].empty?
      program.update(params[:program])
    else
      flash[:message] = "Please fill in all areas to continue."
      redirect "/programs/#{program.slug}/edit"
    end
    redirect "/programs/#{program.slug}"
  end

  # DELETE: /programs/5/delete
  delete "/programs/:slug/delete" do
    if logged_in?
        program = find_by_slug
        if current_user.programs.include?(program)
          if program.routines.each do |routine|
               routine.workouts.destroy_all if !!routine.workouts
             end
             program.routines.destroy_all
          end
          program.destroy
          redirect "/programs"
        else
          flash[:message] = "Something went wrong"
          redirect "/programs/#{@program.slug}"
        end
    else
      flash[:message] = "Something went wrong, please login."
      redirect '/'
    end
  end

end
