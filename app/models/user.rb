class User < ApplicationRecord
  has_many :prohibitions, dependent: :destroy

  devise :omniauthable, :timeoutable, omniauth_providers: %i(hatena)

  def prohibit_entry?(entry)
    prohibitions.map{|prohibition|
      (prohibition.prohibit?(entry.url) && prohibition.domain?) || (prohibition.prohibit?(entry.title) && prohibition.title?)
    }.any?
  end

  def self.from_omniauth(omniauth_hash)
    find_or_create_by(provider: omniauth_hash['provider'], uid:omniauth_hash['uid'])
  end
end
