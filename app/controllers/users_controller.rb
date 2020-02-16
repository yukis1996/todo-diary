class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @nickname = current_user.nickname
    @tasks = current_user.tasks.order("day", "beforetime_id")
  end

  def edit
    @task = current_user.tasks.where(day: Date.current).order("beforetime_id")
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email,:image)
  end

end
