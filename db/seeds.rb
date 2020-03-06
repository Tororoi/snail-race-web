# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Bet.destroy_all
SnailRace.destroy_all
Snail.destroy_all
Shell.destroy_all
Body.destroy_all
Race.destroy_all
Prize.destroy_all
User.destroy_all


red_shell = Shell.create(color: "Red", image: "snail_shell_red.png.png")
orange_shell = Shell.create(color: "Orange", image: "snail_shell_orange.png")
yellow_shell = Shell.create(color: "Yellow", image: "snail_shell_yellow.png")
green_shell = Shell.create(color: "Green", image: "snail_shell_green.png")
blue_shell = Shell.create(color: "Blue", image: "snail_shell_blue.png")
purple_shell = Shell.create(color: "Teal", image: "snail_shell_teal.png")
black_shell = Shell.create(color: "Black", image: "snail_shell_black.png")
white_shell = Shell.create(color: "White", image: "snail_shell_white.png")
gold_shell = Shell.create(color: "Gold", image: "snail_shell_gold.png")

red_body = Body.create(color: "Red", image: "snail_body_red.png")
orange_body = Body.create(color: "Orange", image: "snail_body_orange.png")
yellow_body = Body.create(color: "Yellow", image: "snail_body_yellow.png")
green_body = Body.create(color: "Green", image: "snail_body_green.png")
blue_body = Body.create(color: "Blue", image: "snail_body_blue.png")
purple_body = Body.create(color: "Purple", image: "snail_body_purple.png")
black_body = Body.create(color: "Black", image: "snail_body_black.png")
gray_body = Body.create(color: "Gray", image: "snail_body_gray.png")
gold_body = Body.create(color: "Gold", image: "snail_body_gold.png")

default = Snail.create(name: "Steady Storm", shell_id: orange_shell.id, body_id: gray_body.id, speed: 1.1, favorite_food: "Cabbage")
blue_light = Snail.create(name: "Blue Lightning", shell_id: blue_shell.id, body_id: yellow_body.id, speed: 1.2, favorite_food: "Carrot")
deep_purple = Snail.create(name: "Deep Purple", shell_id: yellow_shell.id, body_id: purple_body.id, speed: 1.4, favorite_food: "Strawberry")
dark_forest = Snail.create(name: "Dark Forest", shell_id: black_shell.id, body_id: green_body.id, speed: 1, favorite_food: "Mushroom")

cabbage = Prize.create(name: "Cabbage", image: "cabbage.png")
carrot = Prize.create(name: "Carrot", image: "carrot.png")
strawberry = Prize.create(name: "Strawberry", image: "strawberry.png")
mushroom = Prize.create(name: "Mushroom", image: "mushroom.png")

race_one = Race.create(name: "First Race", prize_id: cabbage.id)
race_two = Race.create(name: "Second Race", prize_id: mushroom.id)
race_three = Race.create(name: "Third Race", prize_id: carrot.id)
race_four = Race.create(name: "Fourth Race", prize_id: strawberry.id)

fika = User.create(name: "Fika", money: 100)
tom = User.create(name: "Tom", money: 100, password: "password")

SnailRace.create(snail_id: default.id, race_id: race_one.id, odds: 0.5, rank: 2)
SnailRace.create(snail_id: blue_light.id, race_id: race_one.id, odds: 0.3, rank: 4)
SnailRace.create(snail_id: deep_purple.id, race_id: race_one.id, odds: 0.2, rank: 1)
SnailRace.create(snail_id: dark_forest.id, race_id: race_one.id, odds: 0.1, rank: 3)

SnailRace.create(snail_id: default.id, race_id: race_two.id, odds: 0.5, rank: 3)
SnailRace.create(snail_id: blue_light.id, race_id: race_two.id, odds: 0.3, rank: 1)
SnailRace.create(snail_id: deep_purple.id, race_id: race_two.id, odds: 0.2, rank: 2)
SnailRace.create(snail_id: dark_forest.id, race_id: race_two.id, odds: 0.1, rank: 4)

first_bet = Bet.create(snail_race_id: default.id, user_id: fika.id, amount: 5)
second_bet = Bet.create(snail_race_id: blue_light.id, user_id: tom.id, amount: 10)
third_bet = Bet.create(snail_race_id: dark_forest.id, user_id: tom.id, amount: 12)



