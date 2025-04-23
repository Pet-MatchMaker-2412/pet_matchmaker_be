class Api::V1::QuestionnaireSubmissionsController < ApplicationController
  def index
    user = User.find(params[:user_id])

    render json: QuestionnaireSubmissionSerializer.new(user.questionnaire_submissions), status: :ok
  end

  def create
    user = User.find(params[:user_id])

    if valid_answer_ids?
      submission = QuestionnaireSubmission.new(user: user)
      submission.add_answers(submission_params)
      submission.recommended_animal = RecommendedAnimal.all.sample
      submission.save
      render json: QuestionnaireSubmissionSerializer.new(submission), status: :ok
    else
      render json: ErrorSerializer.format_error(ErrorMessage.new("Must have one answer for each question", 422)), status: :unprocessable_entity
    end
  end

  private

  def submission_params
    params.require(:answer_ids)
  end

  def valid_answer_ids?
    answer_id_arrays = Question.all.map do |q|
      q.answers.map do |a|
        a.id
      end
    end

    submission_params.each do |id|
      target = answer_id_arrays.find do |id_array|
        id_array.include?(id)
      end

      answer_id_arrays.delete(target)
    end

    answer_id_arrays.empty?
  end
end
