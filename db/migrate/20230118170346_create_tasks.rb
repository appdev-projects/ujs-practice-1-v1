class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.integer :owner_id
      t.string :status
      t.string :body

      t.timestamps
    end
  end
end
