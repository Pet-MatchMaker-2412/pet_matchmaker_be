class User < ApplicationRecord
  has_many :questionnaire_submissions

  validates :username, presence: true, uniqueness: true

  def self.find_user_by_username(json_request_body)
    parsed_incoming_data = parse_json(json_request_body)
    username = parsed_incoming_data["username"]

    if username.blank?
      return :missing_username
    end

    find_by(username: username)
  end

  private
  def self.parse_json(json_request_body)
    JSON.parse(json_request_body)
  end
end
