# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)







# mint = Ingredient.create!(name: 'Mint')
# lime = Ingredient.create!(name: 'Lime')
# rum = Ingredient.create!(name: 'Rum')
# sugar = Ingredient.create!(name: 'Sugar')


# mojito = Cocktail.create!(name: 'Mojito')

# Dose.create!(cocktail: mojito, ingredient: mint, description: '2 leaves')
# Dose.create!(cocktail: mojito, ingredient: lime, description: '2 slices')
# Dose.create!(cocktail: mojito, ingredient: rum, description: '20 cl')

# ti_punch = Cocktail.create!(name: 'Ti Punch')

# Dose.create!(cocktail: ti_punch, ingredient: sugar, description: '2 spoons')
# Dose.create!(cocktail: ti_punch, ingredient: lime, description: '2 slices')
# Dose.create!(cocktail: ti_punch, ingredient: rum, description: '20 cl')


Booking.destroy_all
Pool.destroy_all
User.destroy_all


puts "running seeds"
nicolas = User.create!(email: 'Nicolas.Goarant@hotmail.fr', password: "secret", first_name: 'Nicolas', last_name: 'Goarant')
nathan = User.create!(email: 'NathanMenard.work@gmail.com', password: "secret", first_name: 'Nathan', last_name: 'Menard')
maella = User.create!(email: 'mdegras@myrezapp.com', password: "secret", first_name: 'Maella', last_name: 'Degras')

nathan_pool = Pool.create!(user: nathan, title: 'A pool closed for all your family', description: 'nice pool for all the family', heated: false, picture: 'src', daily_price: 15)
maella_pool = Pool.create!(user: maella, title: 'A great pool closed to the forest', description: 'a sunny pool with a great barbecue', heated: true, picture: 'src.', daily_price: 20)


starting_date_booking1 = DateTime.now + 3
ending_date_booking1 = DateTime.now + 4
duration_booking1 = (ending_date_booking1 - starting_date_booking1).to_i

starting_date_booking2 = DateTime.now + 3
ending_date_booking2 = DateTime.now + 5
duration_booking2 = (ending_date_booking2 - starting_date_booking2).to_i

total_price_booking1 = duration_booking1 * nathan_pool.daily_price
total_price_booking2 = duration_booking2 * maella_pool.daily_price


booking1 = Booking.create!(user: nicolas, pool: nathan_pool, starting_date: starting_date_booking1, ending_date: ending_date_booking1, total_price: total_price_booking1)
booking2 = Booking.create!(user: nathan, pool: maella_pool, starting_date: starting_date_booking2, ending_date: ending_date_booking2, total_price: total_price_booking2)

puts "seeds ok"
