class AddDescriptionToRecommendedAnimals < ActiveRecord::Migration[7.1]
  def change
    add_column :recommended_animals, :description, :string
  end
end
