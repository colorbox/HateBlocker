require 'rails_helper'

RSpec.feature 'Category index', type: :feature do
  let(:category){ create(:category) }
  let(:user){ create(:user) }
  let!(:prohibition){ create(:title_prohibition, word: 'entry', user: user) }

  before do
    page.set_rack_session(user_identifier: user.identifier)
    page.set_rack_session(access_token: user.access_token)
  end

  scenario 'delete account' do
    visit categories_path

    click_link('アカウント削除')

    expect(User.where(identifier: user.identifier).count).to eq(0)
    expect(Prohibition.count).to eq(0)
  end
end

