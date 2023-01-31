namespace :dev do
  desc "Developer Setup"
  task setup: :environment do
    puts "Reseting Database"
    %x(rails db:drop db:create db:migrate)
    puts "Populating Kinds..."

    kinds = %w(Friend Comercial Acquaintances)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    puts "Kinds Succesfully Populated!"

    ######################

    puts "Populating Contacts..."

    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email:Faker::Internet.email,
        birthdate: Faker::Date.between(65.years.ago, 18.years.ago),
        kind: Kind.all.sample
      )
    end

    puts "Contacts Succesfully Populated"


    ######################## 

    puts "Populating Phones.."

    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create!(number:Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end

    puts "Phones Succesfully Populated!"
  end
end