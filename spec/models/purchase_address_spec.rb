require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep 0.8
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
      end
      it 'delivery_area_idを選択していないと保存できないこと' do
        @purchase_address.delivery_area_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Delivery area must be other than 1")
      end
      it 'municipalitiesが空だと保存できないこと' do
        @purchase_address.municipalities = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'address_numberが空だと保存できないこと' do
        @purchase_address.address_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角数字のみでないと登録できないこと' do
        @purchase_address.phone_number = '090-1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが全角数字だと登録できないこと' do
        @purchase_address.phone_number = '０９０１２３４５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが9桁以内だと登録できないこと' do
        @purchase_address.phone_number = '12345678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが12桁以上の数値では保存できないこと' do
        @purchase_address.phone_number = '009012345678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐ついていないと保存できないこと' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
