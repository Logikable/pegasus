class HomeController < ApplicationController
  def index
    if current_user.nil?
      redirect_to :action => "login"
    else 
      @top_xp_persons = User.order(xp: :desc).limit(5)
      @top_projects = Project.left_joins(:stars).group(:id).order('COUNT(stars.id) DESC').limit(5)
      render "index"
    end
  end

  def login
    render layout: "login", action: "login"
  end
end
