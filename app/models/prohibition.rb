class Prohibition < ApplicationRecord
  belongs_to :user

  enum prohibition_type: {domain: 'domain', title: 'title'}

  scope :is_active, -> { where(activated: true) }

  def prohibit?(target)
    target.include?(word)
  end
end
