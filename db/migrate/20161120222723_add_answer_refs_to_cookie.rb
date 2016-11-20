class AddAnswerRefsToCookie < ActiveRecord::Migration[5.0]
  def change
    add_reference :cookies, :answer, index: true
  end
end
