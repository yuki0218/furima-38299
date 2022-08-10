require 'rails_helper'

RSpec.describe AddressRecord, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @address_record = FactoryBot.build(:address_record, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@address_record).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @address_record.building = ''
        expect(@address_record).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空では保存できないこと' do
        @address_record.post_code = ''
        @address_record.valid?
        expect(@address_record.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角数字のハイフンを含んだ正しい形式でないと保存できないこと' do
        @address_record.post_code = '0000000'
        @address_record.valid?
        expect(@address_record.errors.full_messages).to include("Post code is invalid")
      end
      it 'prefecture_idが空では保存できない' do
        @address_record.prefecture_id = ''
        @address_record.valid?
        expect(@address_record.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが空では保存できない' do
        @address_record.prefecture_id = '1'
        @address_record.valid?
        expect(@address_record.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @address_record.city = ''
        @address_record.valid?
        expect(@address_record.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @address_record.address = ''
        @address_record.valid?
        expect(@address_record.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @address_record.phone_number = ''
        @address_record.valid?
        expect(@address_record.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberに半角数字以外が含まれていると保存できない' do
        @address_record.post_code = '000-0000-0000'
        @address_record.valid?
        expect(@address_record.errors.full_messages).to include("Post code is invalid")
      end
      it 'phone_numberが9桁以下だと保存できない' do
        @address_record.post_code = '123456789'
        @address_record.valid?
        expect(@address_record.errors.full_messages).to include("Post code is invalid")
      end
      it 'phone_numberが12桁以上だと保存できない' do
        @address_record.post_code = '123456789012'
        @address_record.valid?
        expect(@address_record.errors.full_messages).to include("Post code is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @address_record.user_id = nil
        @address_record.valid?
        expect(@address_record.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @address_record.item_id = nil
        @address_record.valid?
        expect(@address_record.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @address_record.token = nil
        @address_record.valid?
        expect(@address_record.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
