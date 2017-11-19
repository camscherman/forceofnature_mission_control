

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

