class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def show
    @nickname = current_user.nickname
    @tasks = current_user.tasks.order("day", "beforetime_id", "aftertime_id")
  end

  def edit
    @task = current_user.tasks.where(day: Date.current)
  end

  def update
    @task = current_user.tasks.where(day: Date.current)
    if current_user.update(user_params)
      redirect_to "/users//#{current_user.id}/edit", notice: "プロフィールを更新しました"
    else
      flash.now[:alert] = '変更内容に不備があります'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email,:image)
  end

end
