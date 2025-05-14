require "json"
require "open-uri"

puts "Adding recipes.."

recipes = [
  {
    name: "Spaghetti Carbonara",
    description: "A classic Roman pasta with eggs, cheese, pancetta, and pepper.",
    image_url: "https://media.istockphoto.com/id/1142391463/photo/pasta-carbonara.webp?a=1&b=1&s=612x612&w=0&k=20&c=JQzF3EBMOs06KMLskSGV_P0rhzl7oFeoEV8Uq-1w_Vk=",
    rating: 4.5
  },
  {
    name: "Margherita Pizza",
    description: "Neapolitan pizza topped with tomato, mozzarella, and fresh basil.",
    image_url: "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?q=80&w=1981&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    rating: 4.8
  },
  {
    name: "Caesar Salad",
    description: "Crisp romaine lettuce with Caesar dressing, croutons, and parmesan.",
    image_url: "https://plus.unsplash.com/premium_photo-1700089483464-4f76cc3d360b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    rating: 4.2
  },
  {
    name: "Pad Thai",
    description: "Stir-fried rice noodles with shrimp, tofu, peanuts, and tamarind sauce.",
    image_url: "https://images.unsplash.com/photo-1655091273851-7bdc2e578a88?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    rating: 4.6
  },
  {
    name: "Fluffy Pancakes",
    description: "Light and fluffy pancakes made with buttermilk and served with maple syrup.",
    image_url: "https://images.unsplash.com/photo-1517306085770-871ff74b2274?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8Zmx1ZmZ5JTIwcGFuY2FrZXN8ZW58MHx8MHx8fDA%3D",
    rating: 4.7
  },
  {
  name: "Avocado Toast",
  description: "Toasted sourdough bread topped with smashed avocado, lemon juice, and chili flakes.",
  image_url: "https://media.istockphoto.com/id/1214212184/photo/avocado-and-poached-egg-toast-on-rye-bread-top-view.webp?a=1&b=1&s=612x612&w=0&k=20&c=SAGFAynH_A5M_s8-ALY2350rTNZC5xnc4Rht5ZcBuNo=",
  rating: 4.5
  },
  {
  name: "Berry Smoothie Bowl",
  description: "A refreshing blend of mixed berries, banana, and yogurt topped with granola and seeds.",
  image_url: "https://media.istockphoto.com/id/1305291791/photo/mixed-berries-smoothie-bowl-on-rustic-wooden-table.webp?a=1&b=1&s=612x612&w=0&k=20&c=UmKQRxqZYvK0LCyxe-gEAaAmcplrfxjLzZOphyJnqFY=",
  rating: 4.8
  },
  {
  name: "Full English Breakfast",
  description: "Traditional British breakfast with eggs, bacon, sausages, baked beans, and toast.",
  image_url: "https://media.istockphoto.com/id/1307778199/photo/full-english-breakfast-on-a-plate-with-fried-eggs-sausages-bacon-beans-toasts-and-coffee-on.jpg?s=612x612&w=0&k=20&c=bQElpkx0Yr18EAaNKXemsN6Zda8dpSDOjX6ugvWT7l4=",
  rating: 4.6
  }
]

categories = [
  {
    name: "Breakfast",
    image_url: "https://media.istockphoto.com/id/2018089052/photo/breakfast-or-brunch-table-scene-on-a-dark-wood-background-overhead-view.jpg?s=612x612&w=0&k=20&c=mv-gn3zxwpBqL2ZNJNcmI0YSI5VPkSiF-8KYPOCN0Aw="
  },
  {
    name: "Lunch",
    image_url: "https://media.istockphoto.com/id/2153766816/photo/spring-fresh-food-with-green-leaf-salads-with-strawberries-bacon-and-ravioli-on-light-wooden.jpg?s=612x612&w=0&k=20&c=HDzYMJNPf-NWMgx--M_rcCCAgqzLCcFU4J7uKDsxrAE="
  },
  {
    name: "Italian",
    image_url: "https://media.istockphoto.com/id/587815190/photo/italian-antipasti-wine-snacks-set-over-black-grunge-background.jpg?s=612x612&w=0&k=20&c=fmy7Ft1tORZihL4BK2ZGsKCwJIc-R4hv-VzljOMMUCE="
  },
  {
    name: "Chinese",
    image_url: "https://media.istockphoto.com/id/1366953086/photo/korean-dishes.jpg?s=612x612&w=0&k=20&c=3nYEdg3y3HfAeJu-Vf5GQYO3iEhFm-syRgSFr6hL874="
  }
]

new_categories = ["Seafood", "Dessert", "Vegetarian", "Chicken"]

def recipe_builder(id)
  url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{id}"
  meal_serialized = URI.parse(url).read
  meal = JSON.parse(meal_serialized)["meals"][0]

  Recipe.create!(
    name: meal["strMeal"],
    description: meal["strInstructions"],
    image_url: meal["strMealThumb"],
    rating: rand(2..5.0).round(1)
  )
end

new_categories.each do |new_category|
  url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=#{new_category}"
  recipe_list = URI.parse(url).read
  new_recipes = JSON.parse(recipe_list)
  new_recipes["meals"].take(10).each do |new_recipe|
    recipe_builder(new_recipe["idMeal"])
  end
end

recipes.each do |recipe_data|
  recipe = Recipe.find_or_initialize_by(name: recipe_data[:name])
  recipe.update!(recipe_data)
end

categories.each do |category_attrs|
  category = Category.find_or_initialize_by(name: category_attrs[:name])
  category.update!(category_attrs)
end

puts "Done seeding!"
