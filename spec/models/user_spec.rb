require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'エラー発生時' do
      it 'ニックネームがないと登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it 'メールアドレスがないと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'メールアドレスが重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスに[@]がないと登録できない' do
        @user.email = 'abcdefG'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードがないと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードが６文字以下だと登録できない' do
        @user.password = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードが全角だと登録できない' do
        @user.password = 'ｚｅｎｋａｋｕ１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードが数値だけでは登録できない' do
        @user.password = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'パスワードが英文字だけでは登録できない' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'パスワードとパスワード再入力が一致していないと登録できない' do
        @user.password = '1234567qwer'
        @user.password_confirmation = '1q1q1q1q1q1q'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'ファーストネームがないと登録できない' do
        @user.f_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("F name can't be blank")
      end

      it 'ファーストネームが全角文でないと登録できない' do
        @user.f_name = 'adfa'
        @user.valid?
        expect(@user.errors.full_messages).to include('F name is invalid')
      end

      it 'ラストネームがないと登録できない' do
        @user.l_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("L name can't be blank")
      end

      it 'ラストネームが全角文字でないと登録できない' do
        @user.l_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('L name is invalid')
      end

      it 'ファーストネーム（カナ）がないと登録できない' do
        @user.f_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("F name kana can't be blank")
      end

      it 'ファーストネーム（カナ）がカナ文字以外だと登録できない' do
        @user.f_name_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('F name kana is invalid')
      end

      it 'ラストネーム（カナ）がないと登録できない' do
        @user.l_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("L name kana can't be blank")
      end

      it 'ラストネーム（カナ）がカナ文字以外だと登録できない' do
        @user.l_name_kana = 'ああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('L name kana is invalid')
      end

      it '生年月日がないと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
    context '登録成功時' do
      it "正常なデータが存在すれば登録できる『ニックネーム、メールアドレス（重複なし）
      パスワード（半角英字、数値混合の６文字以上）
      パスワードと同様のデータが再入力に入っている
      名前（姓）全角、名前（名）全角
      名前（姓）全角（カナ）、名前（名）全角（カナ）
      生年月日』" do
        expect(@user).to be_valid
      end
    end
  end
end
