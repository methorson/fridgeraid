# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds/recipes.rb

# Clear existing records (optional)
# db/seeds/recipes.rb

# Clear existing records (optional)
Recipe.destroy_all
Recipe.create!(
  name: "Spaghetti Carbonara",
  description: "A classic Italian pasta dish with eggs, cheese, pancetta, and black pepper.",
  preparation_time: "30 minutes",
  instruction: "1. Cook pasta. 2. Cook pancetta. 3. Combine with eggs and cheese. 4. Toss with pasta.",
  level_of_difficulty: "Intermediate",
  number_of_portions: 2
)

Recipe.create!(
  name: "Chicken Stir-Fry",
  description: "A quick and easy stir-fry with chicken, vegetables, and a savory sauce.",
  preparation_time: "20 minutes",
  instruction: "1. Slice chicken. 2. Stir-fry with vegetables. 3. Add sauce. 4. Serve hot.",
  level_of_difficulty: "Easy",
  number_of_portions: 4
)

Recipe.create!(
  name: "Homemade Pizza",
  description: "Make your own pizza with fresh dough, tomato sauce, cheese, and your favorite toppings.",
  preparation_time: "45 minutes",
  instruction: "1. Roll out dough. 2. Spread sauce and add toppings. 3. Bake in a hot oven.",
  level_of_difficulty: "Intermediate",
  number_of_portions: 3
)

Recipe.create!(
  name: "Vegetable Curry",
  description: "A flavorful vegetable curry made with a blend of spices and coconut milk.",
  preparation_time: "40 minutes",
  instruction: "1. Sautee vegetables. 2. Add spices and coconut milk. 3. Simmer until cooked.",
  level_of_difficulty: "Intermediate",
  number_of_portions: 4
)

Recipe.create!(
  name: "Chocolate Chip Cookies",
  description: "Classic chocolate chip cookies with a soft and chewy texture.",
  preparation_time: "15 minutes",
  instruction: "1. Mix dough. 2. Drop spoonfuls onto a baking sheet. 3. Bake until golden brown.",
  level_of_difficulty: "Easy",
  number_of_portions: 24
)

Recipe.create!(
  name: "Caesar Salad",
  description: "A refreshing salad with crisp romaine lettuce, croutons, parmesan cheese, and Caesar dressing.",
  preparation_time: "15 minutes",
  instruction: "1. Toss lettuce, croutons, and cheese. 2. Drizzle with Caesar dressing.",
  level_of_difficulty: "Easy",
  number_of_portions: 2
)

Recipe.create!(
  name: "Beef Tacos",
  description: "Tasty beef tacos with seasoned ground beef, salsa, lettuce, and cheese in soft tortillas.",
  preparation_time: "25 minutes",
  instruction: "1. Cook beef with seasoning. 2. Assemble tacos with toppings.",
  level_of_difficulty: "Intermediate",
  number_of_portions: 6
)

Recipe.create!(
  name: "Mango Smoothie",
  description: "A tropical mango smoothie with ripe mangoes, yogurt, and a touch of honey.",
  preparation_time: "10 minutes",
  instruction: "1. Blend mangoes, yogurt, and honey until smooth.",
  level_of_difficulty: "Easy",
  number_of_portions: 2
)

puts "Amazing!"
