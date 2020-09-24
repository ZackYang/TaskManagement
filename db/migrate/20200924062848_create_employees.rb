class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :status

      t.timestamps
    end

    add_index :employees, :id, unique: true
  end
end
