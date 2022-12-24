class Prompt < ApplicationRecord
    validates_presence_of :question

    after_create_commit { broadcast_prepend_to :prompts }
end
