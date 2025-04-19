class CreateQuestionnaireSubmissions < ActiveRecord::Migration[7.1]
  def change
    create_table :questionnaire_submissions do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
