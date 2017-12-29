require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'prohibit entry' do
    let(:category){ create(:category) }
    let!(:entry){ create(:entry, title: 'title', url: 'http://example.com', category: category) }
    let(:user){ create(:user) }
    let!(:prohibition){ create(:title_prohibition, word: 'title', user: user) }

    subject { user.prohibit_entry?(entry) }

    it { is_expected.to eq true }

    context 'prohibit with domain' do
      let!(:prohibition){ create(:domain_prohibition, word: 'example', user: user) }

      it { is_expected.to eq true }
    end

    context 'not prohibit' do
      let!(:prohibition){ create(:title_prohibition, word: 'invalid_title', user: user) }

      it { is_expected.to eq false }

      context 'with domain' do
        let!(:prohibition){ create(:domain_prohibition, word: 'invalid_example', user: user) }

        it { is_expected.to eq false }
      end
    end

    context 'multi prohibit' do
      let!(:prohibition){ create(:title_prohibition, word: 'invalid_title', user: user) }
      let!(:second_prohibition){ create(:domain_prohibition, word: 'invalid_example', user: user) }

      it { is_expected.to eq false }
    end
  end
end
