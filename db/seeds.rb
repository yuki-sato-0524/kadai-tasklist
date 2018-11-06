# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..100).each do |i|
  Task.create(content: "テストタスク　#{i}", status: "テストステ　"+i.to_s)
end

(1..20).each do |s|
  User.create(name:"test#{s}", email:"#{s}@gmail.com", password_digest:"#{s}#{s}#{s}#{s}")
end