class DiariesController < ApplicationController
  before_action :authenticate_user!

  def index
    @diary = Diary.all.order("created_at DESC")
  end

  def new
    @diary = Diary.new
  end


  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to diaries_path, notice: "投稿しました"
    else
      redirect_to new_diary_path, alert: "入力に不備があります"
    end
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
