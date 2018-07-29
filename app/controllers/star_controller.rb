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
      redirect_to(controller: "projects", action: "index")
      return
    end

    receiver_user = User.find_by(email: params[:receiver])
    if receiver_user.nil?
      redirect_to(controller: "projects", action: "index")
      return
    end

    current_user.xp += 1
    current_user.save
    receiver_user.xp += 10
    receiver_user.save

    s = Star.new
    s.project = project
    s.starrer_id = current_user.id
    s.starree_id = receiver_user.id
    s.save

    Update.create(
      description: current_user.name + " gave " + receiver_user.name + " a star for work on " + project.title,
      resource_type: "user",
      resource_id: receiver_user.id,
      user_id: current_user.id
    )
    redirect_to(controller: "projects", action: "index")
  end
end
