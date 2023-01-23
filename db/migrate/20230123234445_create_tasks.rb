class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :owner, null: false, foreign_key: true
      t.string :status, default: "not_yet_started"
      t.string :content

      t.timestamps
    end
  end
end
