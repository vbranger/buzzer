# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Buzz.destroy_all
Game.destroy_all
User.destroy_all

victor = User.create(email: "victor@gmail.com", nickname: "vbranger", password: "123456")
agathe = User.create(email: "agathe@gmail.com", nickname: "agadir", password: "123456")

Game.create(number: 1, user_id: victor.id)