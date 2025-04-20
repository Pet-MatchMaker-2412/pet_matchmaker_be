class Api::V1::QuestionsController < ApplicationController
  def index
    questions = Question.includes(:answers)

    if questions.empty?
      render json: { data: [], message: "No questions available at this time." }, status: :ok
    else
      render json: QuestionSerializer.new(questions), status: :ok
    end
  end
end