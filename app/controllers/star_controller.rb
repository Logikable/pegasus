class StarController < ApplicationController
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
      return
    end

    project = Project.find_by(title: params[:project])
    if project.nil?
      return
    end

    if project.stars == ""
      project.stars << params[:receiver]
    else
      project.stars << "," + params[:receiver]
    end
    project.save
    redirect_to(controller: "projects", action: "show")
  end
end
