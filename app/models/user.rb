class User < ApplicationRecord
  has_many :questionnaire_submissions

  validates :username, presence: true, uniqueness: true
end
