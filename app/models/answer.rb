class Answer < ApplicationRecord
  belongs_to :question
  has_one :cookie

  validates :answer, presence: true
  validates :email, presence: true
end
