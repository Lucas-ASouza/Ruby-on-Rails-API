namespace :dev do
  desc "Developer Setup"
  task setup: :environment do
    puts "Populating Database..."

    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email:Faker::Internet.email,
        birthdate: Faker::Date.between(65.years.ago, 18.years.ago)
      )
    end

    puts "Database Populated!!"
  end

end