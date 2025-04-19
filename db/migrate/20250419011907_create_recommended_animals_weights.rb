class CreateRecommendedAnimalsWeights < ActiveRecord::Migration[7.1]
  def change
    create_table :recommended_animals_weights do |t|
      t.float :weight
      t.references :recommended_animal, null: false, foreign_key: true
      t.references :answer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
