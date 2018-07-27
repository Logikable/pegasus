class ProjectsController < ApplicationController
  def index
    if current_user.nil?
      redirect_to(controller: "home", action: "index")
    else
      @projects = Project.where(owner: current_user.email)
      render "index"
    end
  end

  def show
    if current_user.nil?
      redirect_to(controller: "home", action: "index")
    else
      @project = Project.find_by(title: params[:id])
      if @project.nil?
        redirect_to(controller: "projects", action: "index")
        return
      end
      render "show"
    end
  end

  def new
    if current_user.nil?
      redirect_to(controller: "home", action: "index")
    else
      render "new"
    end      
  end

  def create
    if current_user.nil?
      redirect_to(controller: "home", action: "index")
    else
      user = User.find_by(email: current_user.email)
      if user.nil?
        redirect_to(controller: "projects", action: "index")
        return
      end
      user.xp += 2
      user.save

      Project.create(owner: current_user.email,
        title: params[:title],
        collaborators: params[:collaborators],
        stakeholders: params[:stakeholders],
        description: params[:description],
        tasks: params[:tasks],
        milestones: params[:milestones],
        stars: "",
        )
      redirect_to(controller: "projects", action: "index")
    end
  end
end
