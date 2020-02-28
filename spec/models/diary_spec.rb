require 'rails_helper'

describe Diary do
  describe '#create' do
    # 保存ができる場合
    context 'can save' do
      # 1. user_id、title、impressionが存在すれば登録できること
        # titleが15文字、impression150文字以内でも登録できること
      it "is valid with a user_id、day、doing" do
        user = create(:user)
        diary = user.diaries.build(
          title: "a" * 15,
          impression: "b" * 150,
        )
        expect(diary).to be_valid
      end
    end

    # 保存ができない場合
    context 'can not save' do
      # 2. user_idが空では登録できないこと
      it "is invalid without a user_id" do
        diary = build(:diary, user_id: "")
        diary.valid?
        expect(diary.errors[:user_id]).to include("を入力してください")
      end

      # 3. titleが空では登録できないこと
      it "is invalid without a title" do
        diary = build(:diary, title: "")
        diary.valid?
        expect(diary.errors[:title]).to include("を入力してください")
      end
    
      # 4. impressionが空では登録できないこと
      it "is invalid without a impression" do
        diary = build(:diary, impression: "")
        diary.valid?
        expect(diary.errors[:impression]).to include("を入力してください")
      end

      # 5. titleが16字上だと登録できないこと
      it "Cannot register if title is 16 characters above" do
        diary = build(:diary, title: "a" * 16)
        diary.valid?
        expect(diary.errors[:title]).to include("は15文字以内で入力してください")
      end

      # 6. impressionが151字上だと登録できないこと
      it "Cannot register if impression is 151 characters above" do
        diary = build(:diary, impression: "b" * 151)
        diary.valid?
        expect(diary.errors[:impression]).to include("は150文字以内で入力してください")
      end
    end
  end
end
