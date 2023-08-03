class Quiz < ApplicationRecord
    has_many :prompts
    has_many :quizzes_users
    

    def activate
        self.status = "active"
        self.save!
    end

    def deactivate
        self.status = "unactive"
        self.save!
    end

    def subscribed?
        if QuizzesUser.where(quiz: self, user: current_user).first.present?
            true
        else
            false
        end
    end

end
