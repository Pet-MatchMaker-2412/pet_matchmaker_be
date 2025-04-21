class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user), status: :created
    else
      render json: ErrorSerializer.format_error(ErrorMessage.new(user.errors.full_messages.to_sentence, 422)), status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:username)
  end
end
