class Quiz < ApplicationRecord
    has_many :prompts

    def activate
        self.status = "active"
        self.save!
    end

end
