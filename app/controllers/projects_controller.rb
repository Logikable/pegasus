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

      Update.create(
        description: "Edited a project: " + project.title,
        resource_type: "project",
        resource_id: project.id,
        user_id: current_user.id
      )

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
      project = Project.create(
        owner: current_user.email,
        title: params[:title],
        stakeholders: params[:stakeholders],
        description: params[:description],
        tasks: params[:tasks],
        milestones: params[:milestones],
        team_id: params[:team][:team],
        office: params[:office],
        priority: params[:priority],
        done: false
      )
      collaborators = params[:collaborators].split(",")
      collaborators.each { |c|
        user = User.find_by(name: c)
        ProjectCollaborator.create(
          user_id: user.id,
          project_id: project.id
        )
      }
      Update.create(
        description: "Created a project: " + project.title,
        resource_type: "project",
        resource_id: project.id,
        user_id: current_user.id
      )
      redirect_to(controller: "projects", action: "index")
    end
  end

  def destroy
    if current_user.nil?
      redirect_to(controller: "home", action: "login")
    else
      project = Project.find(params[:id])
      Update.create(
        description: "Deleted a project: " + project.title,
        resource_type: "project",
        resource_id: project.id,
        user_id: current_user.id
      )
      project.destroy
      redirect_to(controller: "projects", action: "index")
    end
  end
end
