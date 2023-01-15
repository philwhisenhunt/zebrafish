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
end
