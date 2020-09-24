# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Employee.destroy_all
Task.destroy_all

ActiveRecord::Base.connection.execute("
  insert into arrangements (
      task_id,
      employee_id
  )
  select
    random()::integer,
    random()::integer
  from generate_series(1, 1000000) s(i)
  ON CONFLICT DO NOTHING
")

ActiveRecord::Base.connection.execute("
  insert into tasks (
      name,
      execution_date,
      created_at,
      updated_at
  )
  select
    random()::text,
    timestamp '2020-09-09 20:00:00',
    timestamp '2020-09-09 20:00:00',
    timestamp '2020-09-09 20:00:00'
  from generate_series(1, 1000000) s(i)
  ON CONFLICT DO NOTHING
")

100.times do
  employee = Employee.create name: Faker::Name.name, email: Faker::Internet.email
  employee.activate! if rand > 0.3
end


100.times do |count|
  puts("Creating #{count} task") if (count % 10 == 0)
  task = Task.create name: Faker::Games::WorldOfWarcraft.quote, execution_date: Faker::Date.between(from: 50.days.ago, to: 50.days.from_now)
  task.employees.push(Employee.activated.sample(3))
end
