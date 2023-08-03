class User < ApplicationRecord
  has_many :quizzes_users
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # do we want users to own the quizzes they make? 
  # or would it be better to have a user both own a quiz but also subscribe to other quizzes?

  # options are a join model or just starting with the basics of connecting a quiz to a creator.
  # to add a creator we would just need a migration

  # Methods to add
  # confirm - email address is confirmed
  # lock - prevent a user from being able to login
end
