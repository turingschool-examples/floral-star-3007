# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@six_flags = AmusementPark.create!(name: "Six Flags", price_of_admission: 49)

@jon = Mechanic.create!(name: "Jon Doe", years_experience: 8)
@kara = Mechanic.create!(name: "Kara Smith", years_experience: 11)

@roller = @six_flags.rides.create!(name: "Roller Coaster", thrill_rating: 9, open: true)
@merry = @six_flags.rides.create!(name: "Merry Go Round", thrill_rating: 2, open: false)
@hammer = @six_flags.rides.create!(name: "Hammer Hitter", thrill_rating: 3, open: true)
@superman = @six_flags.rides.create!(name: "Superman", thrill_rating: 10, open: false)

MechanicRide.create!(mechanic: @jon, ride: @roller)
MechanicRide.create!(mechanic: @jon, ride: @merry)
MechanicRide.create!(mechanic: @jon, ride: @hammer)
