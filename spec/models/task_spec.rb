require 'rails_helper'

describe Task do
  describe '#create' do
    # 保存ができる場合
    context 'can save' do
      # 1. user_id、day、doingが存在すれば登録できること
        # place、doing、memo、が20文字でも登録できること
      it "is valid with a user_id、day、doing" do
        user = create(:user)
        task = user.tasks.build(
          day: 2020-06-11,
          beforetime_id: 11,
          aftertime_id: 23,
          place: "abcdefghij1234567890",
          doing: "1234567890abcdefghij",
          memo: "qrstuvwxyz0987654321",
        )
        expect(task).to be_valid
      end
    end

    # 保存ができない場合
    context 'can not save' do
      # 2. user_idが空では登録できないこと
      it "is invalid without a user_id" do
        task = build(:task, user_id: "")
        task.valid?
        expect(task.errors[:user_id]).to include("を入力してください")
      end

      # 3. dayが空では登録できないこと
      it "is invalid without a day" do
        task = build(:task, day: "")
        task.valid?
        expect(task.errors[:day]).to include("を入力してください")
      end
      
      # 4. doingが空では登録できないこと
      it "is invalid without a doing" do
        task = build(:task, doing: "")
        task.valid?
        expect(task.errors[:doing]).to include("を入力してください")
      end

      # 5. placeが21字以上だと登録できないこと
      it "Cannot register if place is 21 characters above" do
        task = build(:task, place: "a" * 21)
        task.valid?
        expect(task.errors[:place]).to include("は20文字以内で入力してください")
      end

      # 6. doingが21字以上だと登録できないこと
      it "Cannot register if doing is 21 characters above" do
        task = build(:task, doing: "a" * 21)
        task.valid?
        expect(task.errors[:doing]).to include("は20文字以内で入力してください")
      end

      # 7. memoが21字以上だと登録できないこと
      it "Cannot register if memo is 21 characters above" do
        task = build(:task, memo: "a" * 21)
        task.valid?
        expect(task.errors[:memo]).to include("は20文字以内で入力してください")
      end

      # 8. aftertime_idがbeforetime_idより小さいと登録できないこと
      it "Cannot register if aftertime_id is less than beforetime_id" do
        task = build(:task, beforetime_id: 22, aftertime_id:21)
        task.valid?
        expect(task.errors[:aftertime_id]).to include("は#{task.beforetime_id}以上の値にしてください")
      end
    end
  end
end
