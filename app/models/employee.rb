class Employee < ApplicationRecord
  include EmployeeStatus

  has_many :arrangements
  has_many :tasks, through: :arrangements

  validates :status, inclusion: { in: %w(training active) }

  scope :activated,  -> {
    where(status: :active)
  }

  scope :training, -> {
    where(status: :training)
  }
end
