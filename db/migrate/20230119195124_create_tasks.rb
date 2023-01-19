class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.text :content
      t.string :user, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
