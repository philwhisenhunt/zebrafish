class Quiz < ApplicationRecord
    has_many :prompts
    has_many :quizzes_users
    
    # Quiz.joins(:quizzes_users).where(quizzes_users: {user_id: 3})
  

    def activate
        self.status = "active"
        self.save!
    end

    def deactivate
        self.status = "unactive"
        self.save!
    end

    def subscribed?
        if QuizzesUsers.where(quiz: self, user: @current_user).first.present?
            true
        else
            false
        end
    end

end
