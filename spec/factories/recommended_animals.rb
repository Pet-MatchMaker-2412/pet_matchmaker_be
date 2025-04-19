FactoryBot.define do
  factory :recommended_animal do
    type { Faker::Creature::Animal.name }
  end
end
