require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
   before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user, item_id: item)
      sleep 0.1
    end

  describe '購入機能' do
    context "購入できる場合" do
      it "tokenとアドレス情報が適切に入力されていれば登録できる" do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end 

  context '購入できない場合' do
        it "tokenが空では登録できない" do
          @order_address.token = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end 
        it 'postal_codeが空だと保存できない' do
          @order_address.postal_code = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
        end
        it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
          @order_address.postal_code = '1234567'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end
        it 'prefecture{---}（１）では登録できない' do
          @order_address.prefecture_id = "1"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")    
        end
        it 'city_townが空だと保存できない' do
          @order_address.city_town = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("City town can't be blank")
       end
        it 'address_numberが空だと保存できない' do
          @order_address.address_number = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Address number can't be blank")
        end
        it 'phone_numberが空だと保存できない' do
          @order_address.phone_number = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number can't be blank") 
        end
    end 
  end
end
