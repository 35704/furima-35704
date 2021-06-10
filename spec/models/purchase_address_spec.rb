require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @donation_address = FactoryBot.build(:donation_address, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
      end
      it 'building_nameは空でも保存できること' do
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      end
      it 'delivery_area_idを選択していないと保存できないこと' do
      end
      it 'userが紐付いていないと保存できないこと' do
      end
    end
  end
end
