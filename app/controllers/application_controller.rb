class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: ErrorSerializer.format_error(ErrorMessage.new(e, 404)), status: :not_found
  end
end
