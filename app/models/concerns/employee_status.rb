module EmployeeStatus
  extend ActiveSupport::Concern

  included do
    include AASM

    aasm column: :status, no_direct_assignment: true  do
      state :training, initial: true
      state :active


      event :activate do
        transitions from: :training, to: :active
      end

      event :train do
        transitions from: :active, to: :training
      end
    end
  end
end
