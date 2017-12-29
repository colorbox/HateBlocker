categories = %i(general social economics life knowledge it fun entertainment game)

categories.each do |category|
  Category.create(kind: category.to_sym)
end
