class CreateArrangements < ActiveRecord::Migration[6.0]
  def change
    create_table :arrangements do |t|
      t.integer :employee_id
      t.integer :task_id
    end

    add_index(:arrangements, [:employee_id, :task_id], name: 'by_employee_task')
  end
end
