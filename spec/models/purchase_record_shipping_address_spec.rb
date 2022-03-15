require 'rails_helper'

RSpec.describe PurchaseRecordShippingAddress, type: :model do
  describe '商品購入' do
  before do
    @user = FactoryBot.create(:user)
    @furima = FactoryBot.create(:furima)
    @purchase_record_shipping_address = FactoryBot.build(:purchase_record_shipping_address, user_id: @user.id, furima_id: @furima.id)
  end

 
    context '商品購入できる時' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@purchase_record_shipping_address).to be_valid
      end
      it 'building_nameは空でも購入できる' do
        @purchase_record_shipping_address.building_name = ''
        expect(@purchase_record_shipping_address).to be_valid
      end
  end
    context '商品購入できない時' do
      it 'tokenが空では購入できない' do
        @purchase_record_shipping_address.token = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include "Token can't be blank"
      end
      it 'post_cordが空では購入できない' do
        @purchase_record_shipping_address.post_cord = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include "Post cord can't be blank"
      end
      it 'post_cordは3桁ハイフン4桁の半角文字列でないと購入できない' do
        @purchase_record_shipping_address.post_cord = '1234567'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include "Post cord is invalid. Include hyphen(-)"
      end
      it 'cityが空では購入できない' do
        @purchase_record_shipping_address.city = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include "City can't be blank"
      end
      it 'addressが空では購入できない' do
        @purchase_record_shipping_address.address = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include "Address can't be blank"
      end
      it 'phone_numberが空では購入できない' do
        @purchase_record_shipping_address.phone_number = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberは10桁以上11桁以内の半角数値でないと購入できない' do
        @purchase_record_shipping_address.phone_number = '11112222'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include "Phone number is invalid. Input only number"
      end
      it 'phone_numberは12桁以上だと購入できない' do
        @purchase_record_shipping_address.phone_number = '000011112222333'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include "Phone number is invalid. Input only number"
      end
      it 'phone_numberは全角数字だと購入できない' do
        @purchase_record_shipping_address.phone_number = '０００１１１１２２２２'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include "Phone number is invalid. Input only number"
      end
      it 'prefecture_idが空では購入できない' do
        @purchase_record_shipping_address.prefecture_id = '1'
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'userが紐付いていないと購入できない' do
        @purchase_record_shipping_address.user_id = nil
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include "User can't be blank"
      end
      it '商品情報が紐付いていないと購入できない' do
        @purchase_record_shipping_address.furima_id = ''
        @purchase_record_shipping_address.valid?
        expect(@purchase_record_shipping_address.errors.full_messages).to include "Furima can't be blank"
      end
    end
 end
end