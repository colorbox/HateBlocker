class Category < ApplicationRecord
  enum kind: {general:0 , social:1 ,economics:2, fun:3, life:4, knowledge:5, it:6, entertainment:7, game:8}

  has_many :entries
end
