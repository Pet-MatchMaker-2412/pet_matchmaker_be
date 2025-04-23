class User < ApplicationRecord
  has_many :questionnaire_submissions

  validates :username, presence: true, uniqueness: true

  def self.find_by_user_by_username(json_request_body)

  end

  def parse_json(json_request_body)
    
  end
end
