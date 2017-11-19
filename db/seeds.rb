

Event.destroy_all
User.destroy_all
FilePath.destroy_all

User.create(email: "admin@example.com", password: "supersecret", admin: true)
10.times.each do
  User.create( email: Faker::Internet.free_email, password: Faker::Internet.password )
end
@users = User.all

20.times.each do
  date = Faker::Date.forward(60)
  Event.create(title: Faker::Movie.quote,
              description:Faker::Lorem.paragraph(2),
              location: "#{Faker::Address.street_address}",
              start_time: date,
              end_time: ( date+ 2.hours),
              user: @users.sample

              )
end

files = []

30.times.each do
  files.push(Faker::File.file_name)
end

10.times.each do
  files << (Faker::Company.industry.gsub(" ","_"))
end

files.shuffle!

files.each do |f|

    FilePath.create(
    path: f,
    is_folder:  f.include?('.') ? false : true
    )
end

puts "#{FilePath.count} files and folders created"
puts "#{Event.count} events added"

