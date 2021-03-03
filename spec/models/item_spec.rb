require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'アイテム新規登録' do
    before do
      @item = FactoryBot.build(:item)
    end

    context 'エラー発生時' do
      it '画像がないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品名が40文字以上だと登録できない' do
        @item.name = Faker::Lorem.characters(41)
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end

      it '商品説明がないと登録できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it '商品説明が1000文字以上だと登録できない' do
        @item.text = Faker::Base.regexify('[aあ]{1001}')
        @item.valid?
        expect(@item.errors.full_messages).to include('Text is too long (maximum is 1000 characters)')
      end

      it 'カテゴリー情報がないと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'カテゴリーidが１だと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品情報がないと登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '商品情報idが１だと登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it '配送料情報がないと登録できない' do
        @item.delivery_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery burden can't be blank")
      end
      it '配送料IDが１だと登録できない' do
        @item.delivery_burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery burden must be other than 1')
      end
      it '発送元地域情報がないと登録できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it '発送元地域のIDが１だと登録できない' do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 1')
      end
      it '発送までの日にち情報がないと登録できない' do
        @item.delivery_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end
      it '発送までの日にちIDが１だと登録できない' do
        @item.delivery_time_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery time must be other than 1')
      end
      it '販売価格がないと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が300以下だと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '販売価格が9,999,999以上だと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
      it '販売価格は半角数字のみ登録可能' do
        @item.price = '数値以外'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '販売価格が半角英数字混合では登録できない' do
        @item.price = 'hoge1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '販売価格が半角英字のみでは出品できない' do
        @item.price = 'hogehoge'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

    end

    context '登録成功時' do
      it '正しい情報が入っていれば登録できる' do
        expect(@item).to be_valid
      end
    end
  end
end
