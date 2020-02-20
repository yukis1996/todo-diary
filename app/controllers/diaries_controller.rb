class DiariesController < ApplicationController
  before_action :authenticate_user!

  def index
    @diary = Diary.all
  end

  def new
    @diary = Diary.new
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
