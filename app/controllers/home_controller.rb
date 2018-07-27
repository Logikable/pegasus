class HomeController < ApplicationController
  def index
    if current_user.nil?
      redirect_to :action => "login"
    else 
      render "index"
    end
  end

  def login
    render layout: "login", action: "login"
  end
end
