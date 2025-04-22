class Api::V1::QuestionnaireSubmissionsController < ApplicationController
  def index
    user = User.find(params[:user_id])

    render json: QuestionnaireSubmissionSerializer.new(user.questionnaire_submissions), status: :ok
  end
end
