class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :owner, null: false, foreign_key: { to_table: :users }, index: true
      t.string :status

      t.timestamps
    end
  end
end
