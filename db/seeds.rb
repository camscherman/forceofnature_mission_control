# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user = User.first
Event.destroy_all
User.destroy_all
FilePath.destroy_all

User.create(email: "admin@example.com", password: "supersecret", admin: true)
10.times.each do
  User.create( first_name: Faker::Name.name, last_name: Faker::Name.last_name ,email: Faker::Internet.free_email, password: Faker::Internet.password )
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
  files << Faker::File.file_name
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

@files = FilePath.all
my_files=[]
@files.each do |f|
  my_files << f

end

# 5.times do
#   my_files = []
#   users = []
#
#   5.times do
#     my_files << @files.sample
#   end
#
#   5.times do
#     users = @users.sample
#   end
#
#   @briefing = Briefing.new
#   @briefing.allowed_users = users
#   @briefing.file_paths = my_files
#
# end


puts "#{Briefing.count} briefings added"
puts "#{FilePath.count} files and folders created"
puts "#{Event.count} events added"
