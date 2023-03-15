class Prompt < ApplicationRecord
    validates_presence_of :question
    belongs_to :quiz

    after_create_commit { broadcast_prepend_to :prompts }

    def check_answer(answer_attempt)
      
        if self.answer.downcase == answer_attempt.downcase
            return true 
        else
            return false
        end
        
    end

    # Now we need to connect quizzes and prompts with a join model
    # These go in alphabetical order
    # So it would be PromptQuiz as the join model name

    # We can also connect with users as QuizzesUsers

    # add it with
    # create_join_table :quizzes, :users
end
