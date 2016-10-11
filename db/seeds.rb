# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.destroy_all
User.destroy_all
City.destroy_all


person1 = User.create({name: "Alistair T", current_city: "Melbourne", email: "alistairt@gmail.com", password: "password"})
person2 = User.create({name: "Michelle P", current_city: "Atlanta", email: "michellep@gmail.com", password: "password"})
person3 = User.create({name: "Paul B", current_city: "San Francisco", email: "paulb@gmail.com", password: "password"})
person4 = User.create({name: "Test Person", current_city: "Los Angeles", email: "testperson@gmail.com", password: "password"})
person5 = User.create({name: "Admin Person", current_city: "San Francisco", email: "admin@gmail.com", password: "admin"})
person5.admin = true
person5.save


city1 = City.create({name: "San Francisco", image: "http://www.sftravel.com/sites/sftraveldev.prod.acquia-sites.com/files/SanFrancisco_0.jpg"})
city2 = City.create({name: "Gibraltar", image: "http://www.visitgibraltar.gi/images/homepage_slider/df1aw_slide2.jpeg"})
city3 = City.create({name: "London", image: "http://cdn.ek.aero/english/images/London-1_tcm233-2111842.jpg"})


post1 = Post.create({title: "Iconic", body: "The Golden Gate didn't disappoint, either from a distance or up close and personal. Took a lot of photos and would love to see her in all her different moods.
Highly recommend either walking across or hiring a bike (plenty of places - try Blazing Saddles near Fishermans Wharf) and riding across, the views of and from the bridge are excellent."})
post2 = Post.create({title: "Great place to visit and eat", body: "We went to the wharf on a number of occasions to eat and look around. We found a couple of nice bars to have snacks and drinks. Relaxing, really nice area. We walked there and also used hop on hop off bus"})
post3 = Post.create({title: "Go in with a plan!", body: "The British Museum is an amazing collection, and probably too much to do all in one day. Unless you have all day, I suggest doing a little homework to decide on a handful of things you want to see and then wandering between to see what surprises you run into. The Rosetta Stone, Egyptian statues, and the samurai armor were some of our favorites. We tried eating at the cafe at the top of the rotunda, but after 10 minutes we tired of waiting for a server and left. Stick to the counter service cafes on the ground level, they're fine. Overall, the British Museum is worth visiting more than once."})
post4 = Post.create({title: "Amazingly stunning landmark", body: "Big Ben is probably the most recognized landmark in the world, and surely enough at least the most famous clock around! It's a real icon of London and alongside the Houses of Parliament, makes for terrific photography both upfront and from afar. The architecture is amazing and the history even more so. I believe there are also tours that operate as a tour inside but for most its nice just to take a photo and carry on your trip. I definite must see."})
post5 = Post.create({title: "Nice for a walk to meet the monkeys", body: "Climbing the rock is a nice hike. It is amazing to see that the monkeys are not afraid at all to near you and even jump onto people's shoulders."})
post6 = Post.create({title: "A perfect light lunch", body: "We walked past The Lounge Gastro Bar last year and vowed to return when we had more time. The location on the edge of the Marina is really nice and on a sunny day seemed the perfect place for lunch.
Service was attentive bot not fussy and the menu was extensive with many tempting alternatives. We just wanted a light lunch so ordered a Smoked Salmon Tortilla wrap and a New Yorker Chicken Tortilla wrap both with a bit of side salad and both fresh and very tasty. A couple of small Moet bottles soon became four, but the place is so relaxed we wanted to linger a while.
We were tempted to try desert and a Rhubarb and Custard cheese Cake (fantastic) and a good old Chocolate Brownie went down a treat.
Total cost including drinks was around £100.
We would return here without doubt and given the chance would probably have dinner here.
Highly recommended."})
post7 = Post.create({title: "Must do if you're in San Francisco!", body: "Alcatraz was excellent - we did the night tour at 5:45pm and it was awesome... definitely recommend to anyone visiting San Francisco or surrounding area!"})
post8 = Post.create({title: "Challenging but worthwhile", body: "We took cable car up the Mediterranean Steps to the rock and then walked down.
It is a challenging walk and the first 20 steps or so are quite scary particularly if like me you suffer with mild vertigo but it gets a bit easier later and you will have quite a sense of achievement when you reach the bottom.
Be warned some of the steps are quite steep and a little crumbly and it is essential that sensible footwear is worn.
It gets very hot, even doing the descent in early October as the walk is almost entirely in the sun.
The views are often wonderful and overall we were all pleased we did this walk.

Visited October 2016"})
post9 = Post.create({title: "The Five Fields", body: "Truly magical experience, we both tried the full tasting menu with wine pairing, including the freebies they give you, whilst not cheap, it's very much value for money

Service here is just phenomenal, from the sommelier to the bus boy to the waiter, greeter etc.... Top to bottom just outstanding & the food!!!

Too many superlatives. Just go & try but my personal favorites were

Langoustine & pork belly with satay sauce & watermelon
Fois gras
Mutton

Visited October 2016"})


person1.posts << post1
person1.posts << post4
person2.posts << post2
person2.posts << post5
person3.posts << post3
person3.posts << post6
person4.posts <<
person4.posts << post8
person4.posts << post9


city1.posts << post1
city1.posts << post2
city1.posts <<
city2.posts << post5
city2.posts << post6
city2.posts << post8
city3.posts << post3
city3.posts << post4
city3.posts << post9
