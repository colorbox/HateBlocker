class User < ApplicationRecord
  has_many :prohibitions

  def prohibit_entry?(entry)
    prohibitions.map{|prohibition|
      return prohibition.prohibit?(entry.url) if prohibition.domain?
      return prohibition.prohibit?(entry.title) if prohibition.title?
    }.any?
  end
end
