require 'rails_helper'

RSpec.describe Furima, type: :model do
  before do
    @furima = FactoryBot.build(:furima)
  end

  describe '商品出品' do
   context '商品商品できる時' do
     it 'image, name, introduction, condition, category, price, postage, prefecture, days_to_ship, userが正しければ出品できる' do
       expect(@furima).to be_valid
    end
    it 'priceが300なら出品できる' do
      @furima.price = '300'
      expect(@furima).to be_valid
    end
    it 'priceが9,999,999円なら出品できる' do
      @furima.price = '9_999_999'
      expect(@furima).to be_valid
    end
    it 'priceが半角なら出品できる' do
      @furima.price = '300'
      expect(@furima).to be_valid
    end
  end   
   
    context '商品出品できない時' do
      it 'nameが空では出品できない' do
        @furima.name = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Name can't be blank"
      end
      it 'introductionが空では出品できない' do
        @furima.introduction = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Introduction can't be blank"
      end
      it 'condition_idが空では出品できない' do
        @furima.condition_id = '1'
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Condition can't be blank"
     end
      it 'category_idが空では出品できない' do
        @furima.category_id = '1'
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Category can't be blank"
      end
      it 'priceが空では出品できない' do
        @furima.price = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが300以下では出品できない' do
        @furima.price = '299'
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Price is out of setting range"
      end
      it 'priceが9_999_999以上では出品できない' do
        @furima.price = '10_000_000'
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Price is out of setting range"
      end
      it 'priceが全角では出品できない' do
        @furima.price = '３００'
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Price is out of setting range"
      end
      it 'postage_idが空では出品できない' do
        @furima.postage_id = '1'
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Postage can't be blank"
      end
      it 'prefecture_idが空では出品できない' do
        @furima.prefecture_id  = '1'
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'days_to_ship_idが空では出品できない' do
        @furima.days_to_ship_id = '1'
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Days to ship can't be blank"
      end
      it 'imageが空では出品できない' do
        @furima.image = nil
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Image can't be blank"
      end
      it 'userが紐付いていないと出品できない' do
        @furima.user = nil
        @furima.valid?
        expect(@furima.errors.full_messages).to include 'User must exist'
      end
      
    end
  end
end
