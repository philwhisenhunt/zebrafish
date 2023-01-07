class Prompt < ApplicationRecord
    validates_presence_of :question

    after_create_commit { broadcast_prepend_to :prompts }

    def check_answer(answer_attempt)
        # system("say we did it")
        # debugger
        if self.answer == answer_attempt
            return true 
        else
            return false
        end
        
    end
end
