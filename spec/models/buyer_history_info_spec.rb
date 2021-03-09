require 'rails_helper'

RSpec.describe BuyerHistoryInfo, type: :model do
  before do
    @buyItem = FactoryBot.build(:buyer_history_info)
  end

  describe '商品購入' do
    # 正常系
    it '全ての情報が正しければ購入できる' do
      expect(@buyItem).to be_valid
    end

    it '建物データがなくても登録できる' do
      @buyItem.builing_name = ""
      expect(@buyItem).to be_valid
    end

    # 異常系
    it 'トークン情報がないと登録できない' do
      @buyItem.token = ''
      @buyItem.valid?
      expect(@buyItem.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号がないと登録できない' do
      @buyItem.post_num = ''
      @buyItem.valid?
      expect(@buyItem.errors.full_messages).to include("Post num can't be blank")
    end
    it '郵便番号に半角数字以外があると登録できない' do
      @buyItem.post_num = 'dsfa'
      @buyItem.valid?
      expect(@buyItem.errors.full_messages).to include('Post num is invalid')
    end
    it '郵便番号の桁が少ないと登録できない7桁未満' do
      @buyItem.post_num = '123-334'
      @buyItem.valid?
      expect(@buyItem.errors.full_messages).to include('Post num is invalid')
    end
    it '郵便番号の桁が多いと登録できない7桁以上' do
      @buyItem.post_num = '111-11111'
      @buyItem.valid?
      expect(@buyItem.errors.full_messages).to include('Post num is invalid')
    end
    it '都道府県のIDが１だと登録できない' do
      @buyItem.area_id = '1'
      @buyItem.valid?
      expect(@buyItem.errors.full_messages).to include('Area must be other than 1')
    end
    it '都道府県IDがないと登録できない' do
      @buyItem.area_id = ''
      @buyItem.valid?
      expect(@buyItem.errors.full_messages).to include("Area can't be blank")
    end
    it '市区町村がないと登録できない' do
      @buyItem.municipalities = ''
      @buyItem.valid?
      expect(@buyItem.errors.full_messages).to include("Municipalities can't be blank")
    end
    it '電話番号がないと登録できない' do
      @buyItem.phone_num = ''
      @buyItem.valid?
      expect(@buyItem.errors.full_messages).to include("Phone num can't be blank")
    end
    it '電話番号が11桁未満だと登録できない' do
      @buyItem.phone_num = '1234567891'
      @buyItem.valid?
      expect(@buyItem.errors.full_messages).to include('Phone num is invalid')
    end
    it '電話番号が11桁以上たと登録できない' do
      @buyItem.phone_num = '123456789012'
      @buyItem.valid?
      expect(@buyItem.errors.full_messages).to include('Phone num is invalid')
    end
    it '電話番号に半角数字以外があると登録できない' do
      @buyItem.phone_num = '12345k67811'
      @buyItem.valid?
      expect(@buyItem.errors.full_messages).to include('Phone num is invalid')
    end
  end
end
