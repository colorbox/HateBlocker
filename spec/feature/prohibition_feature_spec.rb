require 'rails_helper'

RSpec.feature 'Prohibition index', type: :feature do
  let(:user){ create(:user) }

  before do
    login_as(user)
  end

  scenario 'visit index' do
    visit prohibitions_path

    expect(page).to have_content('ブロック要素の追加')
  end
end
