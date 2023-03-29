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

    # add an alternative answer? Where two things could be accepted

    def check_for_alternative_answers
        self.answer.downcase == answer_attempt.downcase || self.answer.alternatives.contains?(answer_attempt)
    end

    # Now we need to connect quizzes and prompts with a join model
    # These go in alphabetical order
    # So it would be PromptQuiz as the join model name

    # We can also connect with users as QuizzesUsers

    # add it with
    # create_join_table :quizzes, :users

    #But then how to make it so that users subscribe to a quiz? And quizzes have subscribers?
    #generate a join model and a table? Or just one and the other comes with it?

    # Tried rails g migration CreateJoinTableQuizzesUsers quizzes users

    # and made:

    #class CreateJoinTableQuizzesUsers < ActiveRecord::Migration[7.0]
#   def change
#     create_join_table :quizzes, :users do |t|
#       # t.index [:quiz_id, :user_id]
#       # t.index [:user_id, :quiz_id]
#     end
#   end
# end

# but that is not quite what I need. I think I should add a model here too

# rails g model QuizzesUsers quizzes users

# the rails guide seems to be pointing me towards a has_and_belongs_to_many association

# this article seems to make has_many_through make more sense:
# https://stackoverflow.com/questions/35305439/create-join-table-using-migrations-or-models

#things I want to be able to do:
# show me all the quizzes a user made
# show me all the users that have take a quiz
# everytime a user takes a quiz, record it as a session. (Sessions can be incomplete)
# a quiz can have many subscribers
# a quiz can have many prompts
# change prompts to questions? but it is not just a question, but also an answer.

# I'm leaning toward a join model, since that will allow me to add methods if I ever need to. Next step
# is to create that join model and the table to go with it
end
