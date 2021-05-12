require 'rails_helper'

RSpec.describe "Sessions", type: :system do
  describe "ログインページ" do
    let!(:user) { create(:user) }

    before do
      visit login_path
    end

    it "「ログイン」の文字列が存在することを確認" do
      expect(page).to have_content 'ログイン'
    end

    it "正しいタイトルが表示されることを確認" do
      expect(page).to have_title full_title('ログイン')
    end

    it "ヘッダーにログインページへのリンクがあることを確認" do
      expect(page).to have_link 'ログイン', href: login_path
    end

    it "ログインフォームのラベルが正しく表示される" do
      expect(page).to have_content 'メールアドレス'
      expect(page).to have_content 'パスワード'
    end

    it "ログインフォームが正しく表示される" do
      expect(page).to have_css 'input#user_email'
      expect(page).to have_css 'input#user_password'
    end

    it "「ログインしたままにする」チェックボックスが表示される" do
      expect(page).to have_content 'ログインしたままにする'
      expect(page).to have_css 'input#session_remember_me'
    end

    it "ログインボタンが表示される" do
      expect(page).to have_button 'ログイン'
    end