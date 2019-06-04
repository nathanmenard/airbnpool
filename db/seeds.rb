Booking.destroy_all
Pool.destroy_all
User.destroy_all


puts "running seeds"
nicolas = User.create!(email: 'Nicolas.Goarant@hotmail.fr', password: "secret", first_name: 'Nicolas', last_name: 'Goarant')
nathan = User.create!(email: 'NathanMenard.work@gmail.com', password: "secret", first_name: 'Nathan', last_name: 'Menard')
maella = User.create!(email: 'mdegras@myrezapp.com', password: "secret", first_name: 'Maella', last_name: 'Degras')

nathan_pool = Pool.create!(user: nathan, title: 'A pool for all your family', description: 'nice pool for all the family', heated: false, picture: File.open(Rails.root.join('db/fixtures/pools/piscine1.jpg')), daily_price: 15)
maella_pool = Pool.create!(user: maella, title: 'A great pool closed to the forest', description: 'a sunny pool with a great barbecue', heated: true, picture: File.open(Rails.root.join('db/fixtures/pools/pool.jpg')), daily_price: 20)


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
