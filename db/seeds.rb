
puts "Cleaning database..."
Recipe.destroy_all

puts "Creating recipes..."
one = { title: "Tomato Soup", ingredients: "tomatoes, onions, bell peppers, stock", description: "yummy and warm", rating: 5, user_id: 1 }
two = { title: "Beef Stroganoff", ingredients: "skirt steak, onions, greek yoghurt, stock", description: "so delicious! rich", rating: 4, user_id: 1 }
three = { title: "Crunch Wrap", ingredients: "ground beef, tortillas, tortilla chips, taco seasoning", description: "so bad its good", rating: 4, user_id: 1 }

[one, two, three].each do |attributes|
  recipe = Recipe.create!(attributes)
  puts "Created #{recipe.title}"
end
puts "Finished!"
