puts "🌱 Seeding data..."

baked_good_names = ["Croissant", "Rhubarb Pie", "Black and White Cookie", "Scone", "Banana Bread"]

Bakery.create(name: "Northside")
Bakery.create(name: "Southside")
Bakery.create(name: "Eastside")
Bakery.create(name: "Westside")

Bakery.all.each do |bakery|
  3.times do
    BakedGood.create(name: baked_good_names.sample, price: rand(1..5), bakery_id: bakery.id)
    #sample is a method in arrays that gives a random element from the array
  end
end

puts "🌱 Done seeding!"
