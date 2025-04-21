FactoryBot.define do
  factory :recommended_animal do
    animal_type { Faker::Creature::Animal.name }
  end
end
