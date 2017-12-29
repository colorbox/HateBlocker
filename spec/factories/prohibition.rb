FactoryBot.define do
  factory :domain_prohibition, class: Prohibition do
    prohibition_type :domain
    word 'example'
  end

  factory :title_prohibition, class: Prohibition do
    prohibition_type :title
    word 'example'
  end
end
