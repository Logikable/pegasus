class UserController < ApplicationController
  def index
    if current_user.nil?
      redirect_to :controller => 'home', :action => 'index'
    else
      render "index"
    end
  end
end
