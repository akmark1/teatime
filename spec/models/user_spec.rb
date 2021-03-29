require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do

      context 'ユーザー登録ができる時' do

        it '全ての要素があれば新規登録ができる' do
          expect(@user).to be_valid
        end
      
      end

      context 'ユーザー登録ができない時' do

        it 'nicknameが空では登録できないこと' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'emailが空では登録できないこと' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it 'emailは@がなければ登録できないこと' do
          @user.email = 'aaaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end

        it '重複したemailが存在する場合登録できないこと' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end

        it 'passwordが空では登録できないこと' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'passwordが5文字以下であれば登録できないこと' do
          @user.password = '00000'
          @user.password_confirmation = '00000'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end

        it 'passwordは英語のみでは登録できないこと' do
          @user.password = 'aaaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end

        it 'passwordは数字のみでは登録できないこと' do
          @user.password = '1111111'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end

        it 'passwordは全角では登録できないこと' do
          @user.password = '１１１qqq'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end

        it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

      end

    end

  end
end