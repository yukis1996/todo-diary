class TasksController < ApplicationController
  before_action :authenticate_user!
  
  # require "date"   #Dateクラスを使えるようにする
  # require "time"
  def index
    # @today = Date.today  #Date.today(今日の日付)を変数todayに代入する
    @task = current_user.tasks.where(day: Date.current).order("beforetime_id")
  end
  
  def new
    @task = Task.new
    @tasks = current_user.tasks.where(created_at: Date.current.beginning_of_day..Date.current.end_of_day).order("day", "beforetime_id")
  end

  def create
    Task.create(task_params)
    redirect_to new_task_path
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to new_task_path
  end

  def show
    @task = Task.all.whrer(user_id: current_user.id)
  end

  private
  def task_params
    params.require(:task).permit(:day, :beforetime_id, :aftertime_id, :place, :doing, :memo).merge(user_id: current_user.id)
  end

end
