class Api::V1::QuestionnaireSubmissionsController < ApplicationController
  def index
    begin
    user = User.find(params[:user_id])
    
    submissions = user.questionnaire_submissions.includes(:submission_answers, :recommended_animal)
    submissions
    rescue
    end
  end
end