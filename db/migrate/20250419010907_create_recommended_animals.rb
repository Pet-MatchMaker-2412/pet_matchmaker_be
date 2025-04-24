class CreateRecommendedAnimals < ActiveRecord::Migration[7.1]
  def change
    create_table :recommended_animals do |t|
      t.string :animal_type
      t.string :petf_type, null: false
      t.string :petf_breed
      t.string :photo_url, null: false
      
      t.timestamps
    end
  end
end
