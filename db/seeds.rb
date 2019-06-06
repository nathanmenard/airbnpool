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

description_lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."

nathan_pool = Pool.create!(user: nathan, address: 'Rennes', capacity: 15, title: 'A pool for all your family', description: description_lorem, heated: false, picture: File.open(Rails.root.join('db/fixtures/pools/piscine1.jpg')), daily_price: 15)
maella_pool = Pool.create!(user: maella, address: 'Paris', capacity: 10, title: 'A great pool closed to the forest', description: description_lorem, heated: true, picture: File.open(Rails.root.join('db/fixtures/pools/pool.jpg')), daily_price: 20)
simon_pool = Pool.create!(user: simon, address: 'Rennes', capacity: 8, title: 'A nice and heated pool in Britanny', description: description_lorem, heated: true, picture: File.open(Rails.root.join('db/fixtures/pools/piscine2.jpg')), daily_price: 10)
valentin_pool = Pool.create!(user: valentin, address: 'Paris',capacity: 20, title: 'A pool closed to the town', description: description_lorem, heated: true, picture: File.open(Rails.root.join('db/fixtures/pools/piscine3.jpg')), daily_price: 25)
maxime_pool = Pool.create!(user: maxime, address: 'Rennes', capacity: 17, title: 'A pool for seeds-man', description: description_lorem, heated: false, picture: File.open(Rails.root.join('db/fixtures/pools/piscine4.jpg')), daily_price: 17)
aristide_pool = Pool.create!(user: aristide, address: 'Paris', capacity: 20, title: 'In Paris, come on and enjoy my pool', description: description_lorem, heated: true, picture: File.open(Rails.root.join('db/fixtures/pools/piscine5.jpg')), daily_price: 12)
cecile_pool = Pool.create!(user: cecile, address: 'Rennes', capacity: 10, title: 'Closed to Rennes, a great pool', description: description_lorem, heated: false, picture: File.open(Rails.root.join('db/fixtures/pools/piscine6.jpg')), daily_price: 30)
pierre_pool = Pool.create!(user: pierre, address: 'Paris', capacity: 5, title: 'A nice pool, near the mountain', description: description_lorem, heated: true, picture: File.open(Rails.root.join('db/fixtures/pools/piscine7.jpg')), daily_price: 18)
pierre_pool = Pool.create!(user: guillaume, address: '27 rue Frédéric Bazille, Saint-Malo', capacity: 11, title: 'Have a nice day, with a nice pool', description: description_lorem, heated: false, picture: File.open(Rails.root.join('db/fixtures/pools/piscine8.jpg')), daily_price: 21)




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
