class Question < ApplicationRecord
  has_many :answers

  validates: question, prescence: true
end
