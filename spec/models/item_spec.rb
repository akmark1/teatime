require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品新規投稿' do
      
      context '商品の新規投稿ができる時' do
        
        it "全ての項目を入力すれば投稿できる" do
          expect(@item).to be_valid
        end
      
      end

      context '商品の新規投稿ができない時' do
        
        it "nameが空では投稿できないこと" do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it "imageが空では投稿できないこと" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it "descriptionが空では投稿できないこと" do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end

        it "urlが空では投稿できないこと" do
          @item.url = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Url can't be blank")
        end

        it 'ユーザーが紐付いていなければ投稿できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('User must exist')
        end

      end
    end
  end
end
