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
require "open-uri"
FridgeList.destroy_all
User.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
Category.destroy_all

maria = User.create!(
  username: "Maria",
  email:"maria@fridgeraid.com",
  password:"123456"
)

marina = User.create!(
  username: "Marina",
  email:"marina@fridgeraid.com",
  password:"123456"
)

ana = User.create!(
  username: "Ana",
  email:"ana@fridgeraid.com",
  password:"123456"
)
puts "Users ( x )"

categories = {
  "Protein" => ['Chicken','Beef','Salmon','Tofu','Lentils','Shrimp','Turkey','Pork','Eggs'],
  "Carbs & Grains" => ['Bread','Rice','Couscous','Pasta','Barley','Quinoa','Flour','Corn Flour'],
  "Vegetables" => ['Broccoli','Spinach','Carrots','Bell pepper','Zucchini','Tomatoes','Kale','Cauliflower','Asparagus','Green beans'],
  "Fruit" => ['Apples','Bananas','Oranges','Berries','Grapes','Mangoes','Pineapple','Peaches','Strawberries','Watermelon'],
  "Condiments" => ['Olive oil','Salt','Pepper','Garlic','Honey','Soy sauce','Vinegar','Ketchup','Mustard','Mayonnaise'],
  "Dairy Items" => ['Milk','Cheese','Yogurt','Butter','Double Cream','Cottage Cheese','Sour cream','Parmesan','Cream cheese']
}


categories.each do |category, ingredients|
  category = Category.create(name: category)
  ingredients.each do |ingredient|
    Ingredient.create!(name: ingredient, category_id: category.id)
  end
end
puts "Categories ( x )"
puts "Ingredients ( x )"
file = URI.open("https://keeprecipes.com/sites/keeprecipes/files/imagecache/recipe_large/76742_1416351942_0.jpg")
carbonara = Recipe.create(
  name: "Spaghetti Carbonara",
  description: "A classic Italian pasta dish with eggs, cheese, pancetta, and black pepper.",
  preparation_time: "30 minutes",
  instruction: "1. Cook pasta. 2. Cook pancetta. 3. Combine with eggs and cheese. 4. Toss with pasta.",
  level_of_difficulty: "Intermediate",
  number_of_portions: 2,
  user_id: User.first.id
)
carbonara.photo.attach(io: file, filename: "carbonara.jpg", content_type: "image/jpeg")
carbonara.save

# cheese = Ingredient.find_by(name: "cheese")
# RecipeIngredient.create!(ingredient: cheese, recipe: carbonara)
# eggs = Ingredient.find_by(name: "eggs")
# RecipeIngredient.create!(ingredient: eggs, recipe: carbonara)



file = URI.open("https://www.thespruceeats.com/thmb/_EqZNGmAmcn1dWa2dzYL1DIFj60=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/ultimate-chicken-stir-fry-694919-hero-01-5c280c5446e0fb0001fd7aa9.jpg")
chicken = Recipe.create!(
  name: "Chicken Stir-Fry",
  description: "A quick and easy stir-fry with chicken, vegetables, and a savory sauce.",
  preparation_time: "20 minutes",
  instruction: "1. Slice chicken. 2. Stir-fry with vegetables. 3. Add sauce. 4. Serve hot.",
  level_of_difficulty: "Easy",
  number_of_portions: 4,
  user_id: User.first.id
)
chicken.photo.attach(io: file, filename: "chicken.jpg", content_type: "image/jpeg")
chicken.save

file = URI.open("https://therecipecritic.com/wp-content/uploads/2019/05/besthomemadepizzahero.jpg")
pizza = Recipe.create!(
  name: "Homemade Pizza",
  description: "Make your own pizza with fresh dough, tomato sauce, cheese, and your favorite toppings.",
  preparation_time: "45 minutes",
  instruction: "1. Roll out dough. 2. Spread sauce and add toppings. 3. Bake in a hot oven.",
  level_of_difficulty: "Intermediate",
  number_of_portions: 3,
  user_id: User.first.id
)

pizza.photo.attach(io: file, filename: "pizza.jpg", content_type: "image/jpeg")
pizza.save

file = URI.open("https://madhuban.co.uk/wp-content/uploads/2020/06/creamy-chickpea-and-vegetable-curry-104611-1-scaled-2560x1280.jpeg")
curry = Recipe.create!(
  name: "Vegetable Curry",
  description: "A flavorful vegetable curry made with a blend of spices and coconut milk.",
  preparation_time: "40 minutes",
  instruction: "1. Sautee vegetables. 2. Add spices and coconut milk. 3. Simmer until cooked.",
  level_of_difficulty: "Intermediate",
  number_of_portions: 4,
  user_id: User.first.id
)
curry.photo.attach(io: file, filename: "curry.jpg", content_type: "image/jpeg")
curry.save

file = URI.open("https://i0.wp.com/www.livewellbakeoften.com/wp-content/uploads/2017/02/Chocolate-Chip-Cookies-2-1.jpg?w=745&ssl=1")
cookies = Recipe.create!(
  name: "Chocolate Chip Cookies",
  description: "Classic chocolate chip cookies with a soft and chewy texture.",
  preparation_time: "15 minutes",
  instruction: "1. Mix dough. 2. Drop spoonfuls onto a baking sheet. 3. Bake until golden brown.",
  level_of_difficulty: "Easy",
  number_of_portions: 24,
  user_id: User.first.id
)
cookies.photo.attach(io: file, filename: "cookies.jpg", content_type: "image/jpeg")
cookies.save

file = URI.open("https://www.platingsandpairings.com/wp-content/uploads/2018/03/vegan-caessar-salad-recipe-8-scaled.jpg")
salad = Recipe.create!(
  name: "Caesar Salad",
  description: "A refreshing salad with crisp romaine lettuce, croutons, parmesan cheese, and Caesar dressing.",
  preparation_time: "15 minutes",
  instruction: "1. Toss lettuce, croutons, and cheese. 2. Drizzle with Caesar dressing.",
  level_of_difficulty: "Easy",
  number_of_portions: 2,
  user_id: User.first.id
)
salad.photo.attach(io: file, filename: "salad.jpg", content_type: "image/jpeg")
salad.save

file = URI.open("https://littlesunnykitchen.com/wp-content/uploads/2021/01/Mexican-Shredded-Beef-17-1024x1536.jpg")
tacos = Recipe.create!(
  name: "Beef Tacos",
  description: "Tasty beef tacos with seasoned ground beef, salsa, lettuce, and cheese in soft tortillas.",
  preparation_time: "25 minutes",
  instruction: "1. Cook beef with seasoning. 2. Assemble tacos with toppings.",
  level_of_difficulty: "Intermediate",
  number_of_portions: 6,
  user_id: User.first.id
)
tacos.photo.attach(io: file, filename: "tacos.jpg", content_type: "image/jpeg")
tacos.save

file = URI.open("https://www.happinessishomemade.net/wp-content/uploads/2021/08/Refreshing-Mango-Smoothie-Recipe.jpg")
smoothie = Recipe.create!(
  name: "Mango Smoothie",
  description: "A tropical mango smoothie with ripe mangoes, yogurt, and a touch of honey.",
  preparation_time: "10 minutes",
  instruction: "1. Blend mangoes, yogurt, and honey until smooth.",
  level_of_difficulty: "Easy",
  number_of_portions: 2,
  user_id: User.first.id
)
smoothie.photo.attach(io: file, filename: "smoothie.jpg", content_type: "image/jpeg")
smoothie.save

puts "Recipes( x )"

fridge_list = FridgeList.create!(user: marina)
fridge_list = FridgeList.create!(user: maria)
fridge_list = FridgeList.create!(user: ana)

puts "Users' Fridgelists ( x )"

# Ingredient.all.each do |ingredient|
#   fridge_list_ingredient = FridgeListIngredient.create!(fridge_list: fridge_list, ingredient: ingredient)
# end
# puts "Fridge_list_ingredient"
