class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # do we want users to own the quizzes they make? 
  # or would it be better to have a user both own a quiz but also subscribe to other quizzes?
end
