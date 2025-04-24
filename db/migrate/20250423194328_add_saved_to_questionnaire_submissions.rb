class AddSavedToQuestionnaireSubmissions < ActiveRecord::Migration[7.1]
  def change
    add_column :questionnaire_submissions, :saved, :boolean, :default => false
  end
end
