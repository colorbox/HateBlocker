class Prohibition < ApplicationRecord
  belongs_to :user

  enum prohibition_type: {domain: 'domain', title: 'title'}

  def prohibit?(target)
    target.include?(word)
  end
end
