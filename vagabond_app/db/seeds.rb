# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.destroy_all
User.destroy_all

person1 = User.create({name: "Person 1", current_city: "San Francisco", email: "person1@gmail.com", password: "password"})
person2 = User.create({name: "Person 2", current_city: "New York", email: "person2@gmail.com", password: "password"})
person3 = User.create({name: "Person 3", current_city: "Los Angeles", email: "person3@gmail.com", password: "password"})

posta = Post.create({title: "Post A", body: "Post A content"})
postb = Post.create({title: "Post B", body: "Post B content"})
postc = Post.create({title: "Post C", body: "Post C content"})
postd = Post.create({title: "Post D", body: "Post D content"})
poste = Post.create({title: "Post E", body: "Post E content"})
postf = Post.create({title: "Post F", body: "Post F content"})

person1.posts << posta
person2.posts << postb
person2.posts << postc
person3.posts << postd
person3.posts << poste
person3.posts << postf
