module Api
  module V1
    class EmployeeResource < JSONAPI::Resource
      attributes :name,
           :status

      has_many :tasks

      filter :status, apply: ->(records, value, _options) {
        records = records.activated if value[0] == 'activated'
        records = records.training if value[0] == 'training'
        records
      }
    end
  end
end
