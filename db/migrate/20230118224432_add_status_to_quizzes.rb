class AddStatusToQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :quizzes, :status, :string
  end
end
