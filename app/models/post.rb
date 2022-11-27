class Post < ApplicationRecord
    validates_presence_of :body

    after_create_commit { broadcast_prepend_to :posts }
end
