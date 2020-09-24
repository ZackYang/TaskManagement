class Arrangement < ApplicationRecord
  belongs_to :employee
  belongs_to :task

  validates :employee_id, uniqueness: { scope: :task_id, message: "should unique in one task" }
end
