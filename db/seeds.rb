Booking.destroy_all
Pool.destroy_all
User.destroy_all


puts "running seeds"
nicolas = User.create!(email: 'Nicolas.Goarant@hotmail.fr', password: "secret", first_name: 'Nicolas', last_name: 'Goarant')
nathan = User.create!(email: 'NathanMenard.work@gmail.com', password: "secret", first_name: 'Nathan', last_name: 'Menard')
maella = User.create!(email: 'mdegras@myrezapp.com', password: "secret", first_name: 'Maella', last_name: 'Degras')
simon = User.create!(email: 'simon@gmail.com', password: "secret", first_name: 'Simon', last_name: 'Le Fourn')
valentin = User.create!(email: 'valentin@gmail.com', password: "secret", first_name: 'Valentin', last_name: 'Cauwet')
maxime = User.create!(email: 'maxime@gmail.com', password: "secret", first_name: 'Maxime', last_name: 'Le Menaheze')
aristide = User.create!(email: 'aristide@gmail.com', password: "secret", first_name: 'Aristide', last_name: 'Riou')
cecile = User.create!(email: 'cecile@gmail.com', password: "secret", first_name: 'Cecile', last_name: 'Veneziani')
pierre = User.create!(email: 'pierre@gmail.com', password: "secret", first_name: 'Pierre', last_name: 'Facq')
guillaume = User.create!(email: 'guillaume@gmail.com', password: "secret", first_name: 'Guillaume', last_name: 'Cabanel')

description_lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor reprehenderit voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt culpa qui officia deserunt mollit anim id est laborum."

nathan_pool = Pool.create!(user: nathan, capacity: 15, title: 'A pool for all your family', description: description_lorem, heated: false, picture: File.open(Rails.root.join('db/fixtures/pools/piscine1.jpg')), daily_price: 15)
maella_pool = Pool.create!(user: maella, capacity: 10, title: 'A great pool closed to the forest', description: description_lorem, heated: true, picture: File.open(Rails.root.join('db/fixtures/pools/pool.jpg')), daily_price: 20)
simon_pool = Pool.create!(user: simon, capacity: 8, title: 'A nice and heated pool in Quimper', description: description_lorem, heated: true, picture: File.open(Rails.root.join('db/fixtures/pools/piscine2.jpg')), daily_price: 10)
valentin_pool = Pool.create!(user: valentin, capacity: 20, title: 'A pool closed to Lille', description: description_lorem, heated: true, picture: File.open(Rails.root.join('db/fixtures/pools/piscine3.jpg')), daily_price: 25)
maxime_pool = Pool.create!(user: maxime, capacity: 17, title: 'A pool for seeds-man', description: description_lorem, heated: false, picture: File.open(Rails.root.join('db/fixtures/pools/piscine4.jpg')), daily_price: 17)
aristide_pool = Pool.create!(user: aristide, capacity: 20, title: 'In Rennes, come on and enjoy my pool', description: description_lorem, heated: true, picture: File.open(Rails.root.join('db/fixtures/pools/piscine5.jpg')), daily_price: 12)
cecile_pool = Pool.create!(user: cecile, capacity: 10, title: 'Closed to Nantes, a great pool', description: description_lorem, heated: false, picture: File.open(Rails.root.join('db/fixtures/pools/piscine6.jpg')), daily_price: 30)
pierre_pool = Pool.create!(user: pierre, capacity: 5, title: 'A nice pool, near Dijon', description: description_lorem, heated: true, picture: File.open(Rails.root.join('db/fixtures/pools/piscine7.jpg')), daily_price: 18)
pierre_pool = Pool.create!(user: guillaume, capacity: 11, title: 'Have a nice day, with a nice pool', description: description_lorem, heated: false, picture: File.open(Rails.root.join('db/fixtures/pools/piscine8.jpg')), daily_price: 21)




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
