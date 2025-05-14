class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :status, null: false, default: 0
      t.references :team, null: false, foreign_key: true
      t.references :assignee, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
