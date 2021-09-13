# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Mechanic.destroy_all
Ride.destroy_all
AmusementPark.destroy_all

@cp = AmusementPark.create!(name: "Cedar Point", price_of_admission: 60)
@kara = Mechanic.create!(name: "Kara Johnson", yrs_xp: 12)
@jamie = Mechanic.create!(name: "Jamie Marsh", yrs_xp: 5)
@willie = Mechanic.create!(name: "Willie Walsh", yrs_xp: 32)
@topthrill = Ride.create!(name: "Top Thrill Dragster", thrill_rating: 9, open: false, amusement_park: @cp)
@maverick = Ride.create!(name: "Maverick", thrill_rating: 8, open: true, amusement_park: @cp)
@millenium = Ride.create!(name: "Millenium Force", thrill_rating: 10, open: true, amusement_park: @cp)
@kara.rides << @maverick
@kara.rides << @millenium
@kara.rides << @topthrill
@willie.rides << @topthrill
@willie.rides << @millenium
