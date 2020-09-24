class Task < ApplicationRecord
  has_many :arrangements
  has_many :employees, through: :arrangements

  scope :future, -> {
    where("tasks.execution_date > ?", Date.today)
  }

  scope :past, -> {
    where("tasks.execution_date <= ?", Date.today)
  }

end
