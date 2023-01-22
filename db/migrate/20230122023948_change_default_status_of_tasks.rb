class ChangeDefaultStatusOfTasks < ActiveRecord::Migration[6.1]
  def change
    change_column_default :tasks, :status, "new"
  end
end
