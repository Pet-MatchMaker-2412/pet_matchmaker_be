class Answer < ApplicationRecord
  belongs_to :question
  has_many :submission_answers
  has_many :recommended_animals_weights

  validates :text, presence: true
end
