class Category < ApplicationRecord
  enum kind: {economics:0, fun:1, life:2, knowledge:3, it:4, entertainment:5, game:6}

  has_many :entries
end
