class DiariesController < ApplicationController

  def index
    @diary = Diary.all
    # @diaries = Diary.includes(:user)
    # @diary = Diary.all
    # @user = User.find_by(id: params[:id])
    # @user = User.find(id: @diary.user_id)
  end

  def new
    @diary = Diary.new
    # @tasks = current_user.tasks.where(created_at: Date.current.beginning_of_day..Date.current.end_of_day)
    # @tasks = Task.where('created_at >= ?', Date.today).where('created_at =< ?', Date.today)
  end


  def create
    Diary.create(diary_params)
    redirect_to root_path
  end


  def release
    diary =  Diary.find(params[:id])
    diary.released! unless diary.released?
    # redirect_to edit_book_path(diary), notice: 'この作品を公開しました'
  end

  def nonrelease
    diary =  Diary.find(params[:id])
    diary.nonreleased! unless diary.nonreleased?
    # redirect_to edit_book_path(diary), notice: 'この作品を非公開にしました'
  end

  private
  def diary_params
    params.require(:diary).permit(:title, :impression).merge(user_id: current_user.id)
  end

end
