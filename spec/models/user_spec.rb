require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録ができる場合' do
      it '新規登録に必要な項目の全てが存在すれば登録ができる' do
        expect(@user).to be_valid
      end

      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'test123'
        @user.password_confirmation = 'test123'
        expect(@user).to be_valid
     end

      it 'first_nameとlast_nameが全角であれば登録できる' do
        @user.first_name = '木澤'
        @user.last_name = 'こころ'
        expect(@user).to be_valid
      end

      it 'read_first_nameとread_last_nameが全角であれば登録できる' do
        @user.read_first_name = 'キザワ'
        @user.read_last_name = 'ココロ'
        expect(@user).to be_valid
      end
    end

    context '新規登録ができない場合' do
      it 'nicknameが空であると登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailがないと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが数字だけだと登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end

      it 'passwordが英字だけだと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end

      it 'passwordが全角だと登録できない' do
        @user.password = '１２３４５a'
        @user.password_confirmation = '１２３４５a'
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '1234a'
        @user.password_confirmation = '1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'test123'
        @user.password_confirmation = 'test1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_nameが全角入力でなければ登録できない' do
        @user.last_name = 'ｽｽﾞｷ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characteres.")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameが全角入力でなければ登録できない' do
        @user.first_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characteres.")
      end

      it 'read_last_nameが空では登録できない' do
        @user.read_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Read last name can't be blank")
      end

      it 'read_last_nameが全角カタカナでなければ登録できない' do
        @user.read_last_name = 'ｽｽﾞｷ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Read last name is invalid. Input full-width katakana characters.")
      end

      it 'read_first_nameが空では登録できない' do
        @user.read_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Read first name can't be blank")
      end

      it 'read_first_nameが全角カタカナでなければ登録できない' do
        @user.read_first_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Read first name is invalid. Input full-width katakana characters.")
      end

      it 'birth_dayがないと登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
