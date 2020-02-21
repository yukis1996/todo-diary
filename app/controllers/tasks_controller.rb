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
    @tasks = current_user.tasks.where(created_at: Date.current.beginning_of_day..Date.current.end_of_day).order("day", "beforetime_id")
    @task = Task.new(task_params)
    if @task.save
      redirect_to new_task_path
    else
      if @task.day == nil
        redirect_to new_task_path, alert: "日程を入力してください"
      elsif @task.beforetime_id > @task.aftertime_id
        redirect_to new_task_path, alert: "開始時刻以降の時刻を選択してください"
      else
        redirect_to new_task_path, alert: "入力に不備があります"
      end
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_back(fallback_location:index)
  end

  def show
    @task = Task.all.whrer(user_id: current_user.id)
  end

  private
  def task_params
    params.require(:task).permit(:day, :beforetime_id, :aftertime_id, :place, :doing, :memo).merge(user_id: current_user.id)
  end

end
