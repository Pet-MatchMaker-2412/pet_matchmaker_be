class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user), status: :created
    else
      render json: ErrorSerializer.format_error(ErrorMessage.new(user.errors.full_messages.to_sentence, 422)), status: :unprocessable_entity
    end
  end

  def index 
    user = User.find_user_by_username(request.body.read)
    if user == :missing_username
      render json: ErrorSerializer.format_error(ErrorMessage.new("Username is required", 422)), status: :unprocessable_entity
    elsif user == nil
      render json: ErrorSerializer.format_error(ErrorMessage.new("User not found", 404)), status: :not_found
    else 
      render json: UserSerializer.new(user), status: :ok
    end
  end

  private

  def user_params
    params.permit(:username)
  end
end
