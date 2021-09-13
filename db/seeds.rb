# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mech_1 = Mechanic.create({name: "Dog", years_experience: 4})
mech_2 = Mechanic.create({name: "Bird", years_experience: 6})
mech_3 = Mechanic.create({name: "Squirel", years_experience: 20})