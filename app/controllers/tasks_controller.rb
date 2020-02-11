class TasksController < ApplicationController

  def index
  end
  
  def new
    @task = Task.new
    @tasks = Task.all
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

  private
  def task_params
    params.require(:task).permit(:day, :beforetime_id, :aftertime_id, :place, :doing, :memo).merge(user_id: current_user.id)
  end

end
