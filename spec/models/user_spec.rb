require 'rails_helper'

describe User do
  describe '#create' do
    # 1. nameとemail、passwordとpassword_confirmationとprefecture_idが存在すれば登録できること
    it "is valid with a name, email, password, password_confirmation, prefecture_id" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2. nicknameが空では登録できないこと
    it "is invalid without a name" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    # 3. emailが空では登録できないこと
    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    # 4. passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    # 5. prefecture_idが空では登録できないこと
    it "is invalid without a prefecture_id" do
      user = build(:user, prefecture_id: "")
      user.valid?
      expect(user.errors[:prefecture_id]).to include("を入力してください")
    end

    # 6. passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    # 7. 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    # 8. nicknameが11字上だと登録できないこと
    it "Cannot register if nickname is 11 characters above" do
      user = build(:user, nickname: "a" * 11)
      user.valid?
      expect(user.errors[:nickname]).to include("は10文字以内で入力してください")
    end

    # 9. nicknameが10字以内だと登録できること
    it "Can be registered if nickname is within 10 characters" do
      user = build(:user, nickname: "a" * 10)
      expect(user).to be_valid
    end

    # 10. passwordが7字以内だと登録できないこと
    it "Unable to register if password is less than 7 characters" do
      user = build(:user, encrypted_password: "a" * 7)
      user.valid?
      expect(user.errors[:encrypted_password]).to include("は8文字以上で入力してください")
    end

    # 11. passwordが8字以上だと登録できること
    it "Can be registered if password is 8 characters or more" do
      user = build(:user, encrypted_password: "a" * 8)
      expect(user).to be_valid
    end

  end
end