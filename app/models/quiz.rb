class Quiz < ApplicationRecord
    has_many :prompts

    def activate
        self.status = "active"
        self.save!
    end

    def deactivate
        self.status = "unactive"
        self.save!
    end

    def subscribed?
        false
        QuizzesUser.where(quiz: self, user: current_user).first
    end

end
