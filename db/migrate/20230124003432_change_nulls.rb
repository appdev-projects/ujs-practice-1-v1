class ChangeNulls < ActiveRecord::Migration[6.1]
  def change
    change_column_null :tasks, :content, false
    change_column_null :tasks, :status, false
  end
end
