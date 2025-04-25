FactoryBot.define do
  factory :recommended_animal do
    animal_type { Faker::Creature::Animal.name }
    petf_type { Faker::Creature::Animal.name }
    photo_url { Faker::Internet.url }
    description { Faker::Quote.yoda }
  end
end
