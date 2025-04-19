class CreateRecommendedAnimals < ActiveRecord::Migration[7.1]
  def change
    create_table :recommended_animals do |t|
      t.string :type

      t.timestamps
    end
  end
end
