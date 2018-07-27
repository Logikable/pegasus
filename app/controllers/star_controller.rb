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
      redirect_to(controller: "projects", action: "show")
      return
    end

    sender_user = User.find_by(email: current_user.email)
    if sender_user.nil?
      redirect_to(controller: "projects", action: "show")
      return
    end

    receiver_user = User.find_by(email: params[:receiver])
    if receiver_user.nil?
      redirect_to(controller: "projects", action: "show")
      return
    end

    sender_user.xp += 1
    sender_user.save
    receiver_user.xp += 10
    receiver_user.save

    if project.stars == ""
      project.stars << params[:receiver]
    else
      project.stars << "," + params[:receiver]
    end
    project.save
    redirect_to(controller: "projects", action: "show")
  end
end
