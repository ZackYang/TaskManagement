module Api
  module V1
    class TaskResource < JSONAPI::Resource
      attributes :name,
           :execution_date

      has_many :employees

      filter :execution_date

      filter :when, apply: ->(records, value, _options) {
        records = records.future if value[0] == 'future'
        records = records.past if value[0] == 'past'
        records
      }
    end
  end
end
