class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.belongs_to :owner, null: false, foreign_key: { to_table: :users }
      t.text :body
      t.timestamps
    end
  end
end
