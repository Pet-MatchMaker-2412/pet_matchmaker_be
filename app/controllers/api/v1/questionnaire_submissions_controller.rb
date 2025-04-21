class Api::V1::QuestionnaireSubmissionsController < ApplicationController
  def index
    user = User.find_by(id: params[:user_id])
    
    if user
      submissions = user.questionnaire_submissions.includes(:submission_answers, :recommended_animal)
      render json: submissions, include: [:submission_answers, :recommended_animal]
    else
      render json: { error: "User not found" }, status: :not_found
    end
  rescue => e
    render json: { error: e.message }, status: :internal_server_error
  end
end