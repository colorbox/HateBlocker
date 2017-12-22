require 'rails_helper'

RSpec.feature 'Entry index', type: :feature do
  before do
    Entry.create(title: 'test_title', url:'http://google.com', category:'category')
  end

  scenario 'visit index' do
    visit entries_path
    expect(page).to have_text('test_title')
  end
end