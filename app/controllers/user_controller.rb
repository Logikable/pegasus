class UserController < ApplicationController
  def index
    if current_user.nil?
      redirect_to :controller => 'home', :action => 'login'
    else
      render "index"
    end
  end

  def edit
    if current_user.nil?
      redirect_to(controller: "home", action: "login")
    else
      @user = User.find(params[:id])
      if @user.nil?
        redirect_to(controller: "user", action: "index")
        return
      end

      render "edit"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to(controller: "user", action: "index")
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:role, :team)
  end

end
