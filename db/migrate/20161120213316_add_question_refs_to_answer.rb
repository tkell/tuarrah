class AddQuestionRefsToAnswer < ActiveRecord::Migration[5.0]
  def change
    add_reference :answers, :question, index: true
  end
end
