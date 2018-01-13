require 'rails_helper'

RSpec.feature 'Entry index', type: :feature do
  let(:category){ create(:category) }
  let!(:entry1){ create(:entry, title: 'entry1title', url: 'http://example.com', category: category) }
  let!(:entry2){ create(:entry, title: 'entry2title', url: 'http://example2.com', category: category) }
  let!(:entry3){ create(:entry, title: 'entr3title', url: 'http://exampl3.com', category: category) }
  let!(:entry4){ create(:entry, title: 'entry4title', url: 'http://ex4mple.com', category: category) }
  let(:user){ create(:user) }

  before do
    login_as(user)
  end

  scenario 'visit index' do
    visit category_entries_path(category.kind)
    expect(page).to have_text(entry1.title)
    expect(page).to have_text(entry2.title)
    expect(page).to have_text(entry3.title)
  end

  context 'there are title prohibited entry' do
    let!(:prohibition){ create(:title_prohibition, word: 'entry', user: user) }

    scenario 'there is no entries with prohibited title' do
      visit category_entries_path(category.kind)
      expect(page).not_to have_text(entry1.title)
      expect(page).not_to have_text(entry2.title)
      expect(page).to have_text(entry3.title)
    end
  end

  context 'there are url prohibited entry' do
    let!(:first_prohibition){ create(:domain_prohibition, word: 'example', user: user) }
    let!(:second_prohibition){ create(:domain_prohibition, word: 'ex4mple', user: user) }

    scenario 'there is no entries with prohibited domain' do
      visit category_entries_path(category.kind)
      expect(page).not_to have_text(entry1.title)
      expect(page).not_to have_text(entry2.title)
      expect(page).to have_text(entry3.title)
      expect(page).not_to have_text(entry4.title)
    end
  end
end
