require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end
      
      it '郵便番号が(3桁-4桁)であれば保存できる' do
        @order_form.post_code = '123-4560'
        expect(@order_form).to be_valid
      end
      it '都道府県が選択されていれば保存できる' do
          @order_form.prefecture_id = 5
          expect(@order_form).to be_valid
      end
      it '市町村が空ではなければ保存できる' do
        @order_form.city = '松城町'
        expect(@order_form).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @order_form.address = '1-333'
        expect(@order_form).to be_valid
      end
      it '建物が空でも保存できる' do
        @order_form.building = nil
        expect(@order_form).to be_valid
      end
      it '電話番号半角数字かつ10桁以上11桁以下で正しく入力されていれば保存できる' do
        @order_form.telephone = '09088888888'
        expect(@order_form).to be_valid
      end
    end


    context '配送先情報の保存ができないとき' do
      it '郵便番号が空だと保存できないこと' do
        @order_form.post_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank", "Post code is invalid. Include hyphen(-)")
      end
      it '郵便番号がハイフンを含まないと保存できない' do
        @order_form.post_code ='5556666'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '郵便番号が全角数字だと保存できない' do
        @order_form.post_code = '１２３-４５６７'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県が正しく選択されてないと保存できない' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '市町村が空欄だと保存できない' do
        @order_form.address = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it '番地が空だと保存できない' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it '電話番号が空欄だと保存できない' do
        @order_form.telephone = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone can't be blank", "Telephone is invalid")
      end
      it '電話番号が全角数字だと保存できない' do
        @order_form.telephone = '０９０８８８８７７７７'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone is invalid")
      end
      it '電話番号に半角数字以外記載されてたら保存できない' do
        @order_form.telephone = '090-9999-0000'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone is invalid")
      end
      it '電話番号が9桁以下だと保存できない' do
        @order_form.telephone = '0900'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone is invalid")
      end
      it '電話番号が12桁以上だと保存できない' do
        @order_form.telephone = '12345678901234'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone is invalid")
      end
      it 'tokenが空だと保存できない'do
      @order_form.token = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Token can't be blank")
      
      end

    end
  end
end
