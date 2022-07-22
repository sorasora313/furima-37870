require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
  end

  describe '商品の出品登録機能' do
    context '出品登録ができるとき' do
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it 'ユーザー登録している人でないと出品できない' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it "商品画像は必須" do
        @item.image = nil
        sleep(1)
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "説明が空だと出品できない" do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end

      it "カテゴリーの選択が必須である" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "商品の状態の選択が必須である" do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it "配送料の負担についての選択が必須である" do
        @item.charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end

      it "発送元の地域についての選択が必須である" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "発送までの日数についての選択が必須である" do
        @item.schedule_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Schedule day is not a number")
      end
      it "価格の入力が必須であること" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格は半角数字以外では登録できない' do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '価格は半角数字以外では登録できない' do
        @item.price = "vvv"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "価格の最低価格は¥300である" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "最高価格が¥9,999,999の間である" do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end