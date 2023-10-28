require 'rails_helper'

describe 'Adminモデルのテスト', Admin do
  describe 'バリデーションのテスト' do
    # factoriesで作成したダミーデータを使用します。
    let(:admin) { FactoryBot.create(:admin) }

    it "name,email,password,password_confimationがある場合は登録できること" do
        admin.valid?
        expect(admin).to be_valid
    end

    it "nameがない場合は登録できないこと" do
      admin.name = nil
      admin.valid?
      expect(admin.errors.full_messages).to include("Name can't be blank")
    end

    it "emailがない場合は登録できないこと" do
      admin.email = nil
      admin.valid?
      expect(admin.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordとpassword_confimationが一致しない場合は登録できないこと" do
      admin.password = "password"
      admin.password_confirmation = "password123"
      admin.valid?
      expect(admin.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end