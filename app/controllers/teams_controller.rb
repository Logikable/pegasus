class TeamsController < ApplicationController
  def index
    if current_user.nil?
      redirect_to(controller: "home", action: "login")
    else
      @teams = Team.all
      render "index"
    end
  end

  def show
    if current_user.nil?
      redirect_to(controller: "home", action: "login")
    else
      @team = Team.find(params[:id])
      if @team.nil?
        redirect_to(controller: "teams", action: "index")
        return
      end
      render "show"
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

      Team.create(
        name: params[:name],
        description: params[:description]
      )
      redirect_to(controller: "teams", action: "index")
    end
  end

  def destroy
    if current_user.nil?
      redirect_to(controller: "home", action: "login")
    else
      Team.find(params[:id]).destroy
      redirect_to(controller: "teams", action: "index")
    end
  end
end
