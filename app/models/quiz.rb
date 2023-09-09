class Quiz < ApplicationRecord
    has_many :prompts
    has_many :quizzes_users
    
    # a subscriber belongs to a user
    # a user has_one subscriber
    # a quiz has many subscribers
    # a subscriber has many quizzes
    # a user has many quizzes through subscribers
    
    # or
    # a user has many subscriptions 
    # a user has many quizzes through subscriptions

    # Next up:
    # Create subscriptions model
    # Create quizzesSubscription join table
    # User.quizzesSubscriptions should allow us to get the quizzes via a joins table
    # Quiz.joins(quizzesSubscriptions.where(quizzesSubscriptions: {user_id: @user.id}))

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
