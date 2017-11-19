# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.destroy_all
20.times.each do
 date = Faker::Date.forward(60)
 Event.create(title: Faker::Movie.quote,
             description:Faker::Lorem.paragraph(2),
             location: "#{Faker::Address.street_address}",
             start_time: date,
             end_time: ( date+ 2.hours)
             )
end

puts "#{Event.count} events added"
