class AddExecDateIndexInTasks < ActiveRecord::Migration[6.0]
  def change
    add_index(:tasks,  :execution_date)
  end
end
