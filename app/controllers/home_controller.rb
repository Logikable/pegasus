class HomeController < ApplicationController

  def index
    if current_user.nil?
      redirect_to :action => "login"
    else 
      @top_xp_persons = User.order(xp: :desc).limit(5)
      @top_projects = Project.left_joins(:stars).group(:id).order('COUNT(stars.id) DESC').limit(5)
      @updates = Update.order(created_at: :desc).limit(10)
      @user_results = nil
      @project_results = nil
      @team_results = nil
      render "index"
    end
  end

  def login
    render layout: "login", action: "login"
  end

  def search
    if current_user.nil?
      redirect_to :action => "login"
    else 
      @user_results = User.search(params[:query])
      @project_results = Project.search(params[:query])
      @team_results = Team.search(params[:query])
    end
  end

end
