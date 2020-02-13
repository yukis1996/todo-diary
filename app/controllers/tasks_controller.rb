class TasksController < ApplicationController
  
  # require "date"   #Dateクラスを使えるようにする

  def index
    # @today = Date.today  #Date.today(今日の日付)を変数todayに代入する
    @task = current_user.tasks.where(day: Date.today).order("beforetime_id")
  end
  
  def new
    @task = Task.new
    @tasks = current_user.tasks.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day)
    # @tasks = Task.where('created_at >= ?', Date.today).where('created_at =< ?', Date.today)
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
