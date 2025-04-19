class AddRecommendedAnimalToQuestionnaireSubmissions < ActiveRecord::Migration[7.1]
  def change
    add_reference :questionnaire_submissions, :recommended_animal, null: false, foreign_key: true
  end
end
