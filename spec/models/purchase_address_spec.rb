require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入機能の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end

      it '建物名は空でも保存できること' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context  '内容に問題がある場合' do
      it 'tokenが空だと登録できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空だと保存できないこと' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect( @purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが「3桁ハイフン4桁」の半角文字列でないと保存できないこと' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect( @purchase_address.errors.full_messages).to include("Postal code is invalid")
      end

      it 'prefecture_idの1以外を選択していないと保存できないこと' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect( @purchase_address.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'cityが空だと保存できないこと' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect( @purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空だと保存できないこと' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect( @purchase_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect( @purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが9桁以下では保存ができないこと' do
        @purchase_address.phone_number = '090123456'
        @purchase_address.valid?
        expect( @purchase_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが12桁以上では保存ができないこと' do
        @purchase_address.phone_number = '090123456789'
        @purchase_address.valid?
        expect( @purchase_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'userが紐付いていないと保存できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect( @purchase_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
