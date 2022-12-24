class AddQuestionAndAnswerToPrompts < ActiveRecord::Migration[7.0]
  def change
    add_column :prompts, :question, :string
    add_column :prompts, :answer, :string
  end
end
