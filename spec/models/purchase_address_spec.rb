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
        binding.pry
        expect(@purchase_address).to be_valid
      end

      it '建物名は空でも保存できること' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context  '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        
      end

      it 'postal_codeが「3桁ハイフン4桁」の半角文字列でないと保存できないこと' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?

      end

      it 'prefecture_idを選択していないと保存できないこと' do
        @purchase_address.prefecture_id = 1
        @prefecture_address.valid?

      end

      it 'cityが空だと保存できないこと' do
        @purchase_address.city = ''
        @purchase_address.valid?

      end

      it 'house_numberが空だと保存できないこと' do
        @purchase_address.house_number = ''
        @purchase_address.valid?

      end

      it 'phone_numberが空だと保存できないこと' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?

      end

      it 'phone_numberが9桁以下では保存ができないこと' do

      end

      it 'phone_numberが12桁以上では保存ができないこと' do

      end

      it 'userが紐付いていないと保存できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?

      end
    end
  end
end
