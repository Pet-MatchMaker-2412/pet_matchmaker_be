class CreateSubmissionAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :submission_answers do |t|
      t.references :questionnaire_submission, null: false, foreign_key: true
      t.references :answer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
