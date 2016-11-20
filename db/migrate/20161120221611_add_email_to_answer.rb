class AddEmailToAnswer < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :email, :string
  end
end
