class User < ApplicationRecord
  has_many :questionnaire_submissions
end
