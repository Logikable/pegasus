class ProjectsController < ApplicationController
  def index
    if current_user.nil?
      redirect_to(controller: "home", action: "login")
    else
      @my_projects = Project.where(owner: current_user.email)
      render "index"
    end
  end

  def show
    if current_user.nil?
      redirect_to(controller: "home", action: "login")
    else
      @project = Project.find(params[:id])
      if @project.nil?
        redirect_to(controller: "projects", action: "index")
        return
      end
      render "show"
    end
  end

  def edit
    if current_user.nil?
      redirect_to(controller: "home", action: "login")
    else
      project = Project.find(params[:id])
      if project.nil?
        redirect_to(controller: "projects", action: "index")
        return
      end
      if project.done
        redirect_to(project_path(params[:id]))
        return
      end

      project.done = true
      project.save
      current_user.xp += 5
      current_user.save

      redirect_to(project_path(params[:id]))
    end
  end

  def new
    if current_user.nil?
      redirect_to(controller: "home", action: "login")
    else
      render "new"
    end      
  end

  def create
    if current_user.nil?
      redirect_to(controller: "home", action: "login")
    else
      current_user.xp += 2
      current_user.save

      puts params
      Project.create(
        owner: current_user.email,
        title: params[:title],
        collaborators: params[:collaborators],
        stakeholders: params[:stakeholders],
        description: params[:description],
        tasks: params[:tasks],
        milestones: params[:milestones],
        team_id: params[:team][:team],
        done: false
      )
      redirect_to(controller: "projects", action: "index")
    end
  end

  def destroy
    if current_user.nil?
      redirect_to(controller: "home", action: "login")
    else
      Project.find(params[:id]).destroy
      redirect_to(controller: "projects", action: "index")
    end
  end
end
