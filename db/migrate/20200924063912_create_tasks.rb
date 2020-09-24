class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :execution_date

      t.timestamps
    end

    add_index :tasks, :id, unique: true
  end
end
