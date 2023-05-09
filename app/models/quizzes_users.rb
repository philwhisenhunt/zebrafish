class QuizzesUsers < ApplicationRecord
  belongs_to :quizzes
  belongs_to :user
end
