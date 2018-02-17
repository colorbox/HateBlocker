require 'rails_helper'

RSpec.feature 'Category index', type: :feature do
  let!(:general){ create(:category, kind: 'general') }
  let!(:social){ create(:category, kind: 'social') }
  let!(:economics){ create(:category, kind: 'economics') }
  let!(:life){ create(:category, kind: 'life') }
  let!(:knowledge){ create(:category, kind: 'knowledge') }
  let!(:it){ create(:category, kind: 'it') }
  let!(:fun){ create(:category, kind: 'fun') }
  let!(:entertainment){ create(:category, kind: 'entertainment') }
  let!(:game){ create(:category, kind: 'game') }
  let(:user){ create(:user) }

  before do
    login_as(user)
  end

  scenario 'confirm display name' do
    visit category_entries_path(general)

    expect(page).to have_content('一般')
    expect(page).to have_content('世の中')
    expect(page).to have_content('政治と経済')
    expect(page).to have_content('暮らし')
    expect(page).to have_content('学び')
    expect(page).to have_content('テクノロジー')
    expect(page).to have_content('おもしろ')
    expect(page).to have_content('エンタメ')
    expect(page).to have_content('アニメとゲーム')
  end
end
