puts "Cleaning database.."
Recipe.destroy_all
puts "Adding recipes.."

recipes = [
  {
    name: "Spaghetti Carbonara",
    description: "A classic Roman pasta with eggs, cheese, pancetta, and pepper.",
    image_url: "https://media.istockphoto.com/id/1065506718/photo/carbonara-pasta-spaghetti-with-pancetta-egg-parmesan-cheese-and-cream-sauce-traditional.jpg?s=2048x2048&w=is&k=20&c=redISdsQUulGgIyFzZfEuLj4IAZRgltJomGqTv1kkh4=",
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
  image_url: "https://media.istockphoto.com/id/1214212184/photo/avocado-and-poached-egg-toast-on-rye-bread-top-view.jpg?s=2048x2048&w=is&k=20&c=5x98lv9AkzGxW4lKaqT-8rCmbNcadzeMwHxTScSZiDY=",
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

recipes.each do |recipe_data|
  Recipe.create!(recipe_data)
end

puts "Done seeding!"
