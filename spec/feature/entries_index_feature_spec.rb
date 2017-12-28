require 'rails_helper'

RSpec.feature 'Entry index', type: :feature do
  let(:category){ FactoryBot.create(:category) }
  let!(:entry){ FactoryBot.create(:entry, category: category) }
  let(:user){ FactoryBot.create(:user) }

  before do
    page.set_rack_session(user_identifier: user.identifier)
    page.set_rack_session(access_token: user.access_token)
  end

  scenario 'visit index' do
    visit category_entries_path(category.kind)
    expect(page).to have_text(entry.title)
  end
end
