FactoryBot.define do
  factory :answer do
    text { Faker::Quotes::Shakespeare.as_you_like_it_quote }
    question
  end
end
