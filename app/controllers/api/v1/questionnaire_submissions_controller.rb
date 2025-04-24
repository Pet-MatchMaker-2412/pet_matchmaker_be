class Api::V1::QuestionnaireSubmissionsController < ApplicationController
  def index
    user = User.find(params[:user_id])

    render json: QuestionnaireSubmissionSerializer.new(user.questionnaire_submissions.where(saved: true)), status: :ok
  end

  def create
    user = User.find(params[:user_id])

    if valid_answer_ids?
      submission = QuestionnaireSubmission.new(user: user)
      submission.add_answers(submission_params)
      submission.recommended_animal = RecommendedAnimal.calculate_animal(submission.submission_answers)
      submission.save
      render json: QuestionnaireSubmissionSerializer.new(submission), status: :ok
    else
      render json: ErrorSerializer.format_error(ErrorMessage.new("Must have one answer for each question", 422)), status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:user_id])
    submission = QuestionnaireSubmission.find(params[:id])

    if submission.user.id == user.id
      if update_params == true || update_params == false
        submission.saved = update_params
        render json: QuestionnaireSubmissionSerializer.new(submission), status: :ok
      else
        render json: ErrorSerializer.format_error(ErrorMessage.new("Saved param must be true or false", 422)), status: :unprocessable_entity
      end
    else
      render json: ErrorSerializer.format_error(ErrorMessage.new("Couldn't find QuestionnaireSubmission with 'id'=#{params[:id]} under 'user_id'=#{params[:user_id]}", 404)), status: :not_found
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
      return false if target.nil?

      answer_id_arrays.delete(target)
    end

    answer_id_arrays.empty?
  end

  def update_params
    params.require(:saved)
  end
end
