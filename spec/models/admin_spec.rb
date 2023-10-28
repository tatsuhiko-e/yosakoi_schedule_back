require 'rails_helper'

describe 'Adminモデルのテスト', Admin do
  describe 'バリデーションのテスト' do
    # factoriesで作成したダミーデータを使用します。
    let(:admin) { FactoryBot.create(:admin) }
    let(:admin2) { FactoryBot.create(:admin) }

    it "name,email,password,password_confimationがある場合は登録できること" do
        admin.valid?
        expect(admin).to be_valid
    end

    it "nameがない場合は登録できないこと" do
      admin.name = nil
      admin.valid?
      expect(admin.errors.full_messages).to include("Name can't be blank")
    end

    it "nameが漢字、ひらがな、カタカナ以外の場合は登録できないこと" do
      admin.name = "abcdefg"
      admin.valid?
      expect(admin.errors.full_messages).to include("Name は漢字、ひらがな、カタカナのみが許可されています")
    end

    it "nameが21文字以上の場合は登録できないこと" do
      admin.name = "あああああああああああああああああああああ"
      admin.valid?
      expect(admin.errors.full_messages).to include("Name is too long (maximum is 20 characters)")
    end

    it "emailがない場合は登録できないこと" do
      admin.email = nil
      admin.valid?
      expect(admin.errors.full_messages).to include("Email can't be blank")
    end

    it "emailが重複していたら登録できないこと" do
      admin.email = admin2.email
      admin.valid?
      expect(admin.errors.full_messages).to include("Email has already been taken")
    end

    it 'メールアドレスが "@" を含まない場合は無効であること' do
      admin.email = "example.com"
      admin.valid?
      expect(admin.errors.full_messages).to include("Email が正しい形式ではありません")
    end

    it 'メールアドレスがドメイン部分を含まない場合は無効であること' do
      admin.email = "user@"
      admin.valid?
      expect(admin.errors.full_messages).to include("Email が正しい形式ではありません")
    end

    it 'メールアドレスが "." でドメインを区切らない場合は無効であること' do
      admin.email = "user@examplecom"
      admin.valid?
      expect(admin.errors.full_messages).to include("Email is not an email")
    end

    it 'メールアドレスがスペースを含む場合は無効であること' do
      admin.email = "user@example.com with space"
      admin.valid?
      expect(admin.errors.full_messages).to include("Email が正しい形式ではありません")
    end

    it 'メールアドレスが無効な文字を含む場合は無効であること' do
      admin.email = "user#example.com"
      admin.valid?
      expect(admin.errors.full_messages).to include("Email が正しい形式ではありません")

      admin.email = "user@example,com"
      admin.valid?
      expect(admin.errors.full_messages).to include("Email が正しい形式ではありません")
    end

    it 'メールアドレスが連続するドットを含む場合は無効であること' do
      admin.email = "user@example..com"
      admin.valid?
      expect(admin.errors.full_messages).to include("Email が正しい形式ではありません")
    end

    it "passwordとpassword_confimationが一致しない場合は登録できないこと" do
      admin.password = "password"
      admin.password_confirmation = "password123"
      admin.valid?
      expect(admin.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordとpassword_confimationがない場合は登録できないこと" do
      admin.password = nil
      admin.password_confirmation = nil
      admin.valid?
      expect(admin.errors.full_messages).to include("Password can't be blank", "Password confirmation can't be blank")
    end

    it "passwordとpassword_confimationが8文字未満だと登録できないこと" do
      admin.password = "Pass123"
      admin.password_confirmation = admin.password
      admin.valid?
      expect(admin.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end

    it "passwordとpassword_confimationに大文字が含まれていないと登録できないこと" do
      admin.password = "password123"
      admin.password_confirmation = admin.password
      admin.valid?
      expect(admin.errors.full_messages).to include("Password は大文字、小文字、数字を含む必要があります")
    end

    it "passwordとpassword_confimationに小文字が含まれていないと登録できないこと" do
      admin.password = "PASSWORD123"
      admin.password_confirmation = admin.password
      admin.valid?
      expect(admin.errors.full_messages).to include("Password は大文字、小文字、数字を含む必要があります")
    end

    it "passwordとpassword_confimationに数字が含まれていないと登録できないこと" do
      admin.password = "PASSWORD"
      admin.password_confirmation = admin.password
      admin.valid?
      expect(admin.errors.full_messages).to include("Password は大文字、小文字、数字を含む必要があります")
    end
  end
end