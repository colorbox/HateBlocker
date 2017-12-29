class User < ApplicationRecord
  has_many :prohibitions

  def prohibit_entry?(entry)
    prohibitions.map{|prohibition|
      (prohibition.prohibit?(entry.url) && prohibition.domain?) || (prohibition.prohibit?(entry.title) && prohibition.title?)
    }.any?
  end
end
