FactoryBot.define do
  factory :recommended_animals_weight do
    weight { Faker::Number.between(from: 0.00, to: 1.00) }
    recommended_animal 
    answer
  end
end
