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

  scenario 'add domain prohibition' do
    visit prohibitions_path

    fill_in :input_word, with: 'test_domain'

    click_button 'add'

    expect(Prohibition.first.word).to eq('test_domain')
    expect(Prohibition.first.prohibition_type).to eq('domain')
  end
end
