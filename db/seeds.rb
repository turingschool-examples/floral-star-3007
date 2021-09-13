AmusementPark.destroy_all
Mechanic.destroy_all
Ride.destroy_all
RideMechanic.destroy_all


hpw = AmusementPark.create!(name: "Harry Potter World", price_of_admission: 20)
mechanic1 = Mechanic.create!(name: "Gypsy", years_of_experience: 15)
ride1 = hpw.rides.create!(name: "Ferris Wheel", thrill_rating: 2, open: true)
ride2 = hpw.rides.create!(name: "Roller Coaster", thrill_rating: 9, open: true)
ride3 = hpw.rides.create!(name: "Tea Cups", thrill_rating: 3, open: false)
ride4 = hpw.rides.create!(name: "Tower of Doom", thrill_rating: 10, open: true)
RideMechanic.create!(ride_id: ride1.id, mechanic_id: mechanic1.id)
RideMechanic.create!(ride_id: ride2.id, mechanic_id: mechanic1.id)
RideMechanic.create!(ride_id: ride3.id, mechanic_id: mechanic1.id)
RideMechanic.create!(ride_id: ride4.id, mechanic_id: mechanic1.id)
