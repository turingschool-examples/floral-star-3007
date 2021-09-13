# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@mechanic1 = Mechanic.create!(name: 'Joe', years_experience: 10)
@mechanic2 = Mechanic.create!(name: 'Jan', years_experience: 5)
@park1 = AmusementPark.create!(name: 'Funtown', price_of_admission: 50.00)
@park2 = AmusementPark.create!(name: 'Splashtown', price_of_admission: 70.00)
@ride1 = @mechanic1.rides.create!(name: 'Bathroom', thrill_rating: '10', open: true, amusement_park_id: @park1.id)
@ride2 = @mechanic1.rides.create!(name: 'Slide', thrill_rating: '20', open: true, amusement_park_id: @park1.id)
@ride3 = @mechanic1.rides.create!(name: 'Bumper Cars', thrill_rating: '35', open: true, amusement_park_id: @park1.id)
@ride5 = Ride.create!(name: 'Ride 5', thrill_rating: '25', open: true, amusement_park_id: @park2.id)
