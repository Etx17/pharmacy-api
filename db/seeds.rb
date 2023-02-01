p 'Cleaning database...'
OrderProduct.destroy_all
Sale.destroy_all
SaleProduct.destroy_all
Product.destroy_all
Order.destroy_all
Laboratory.destroy_all
Pharmacy.destroy_all
p 'Database cleaned!'

p 'Creating fake data...'
20.times do
  Laboratory.create!(
    name: Faker::Company.name,
    email: Faker::Internet.email,
  )
  Pharmacy.create!(
    name: Faker::Company.name,
    city: ['Paris', 'Lyon', 'Bordeaux', 'Marseille', 'Dijon', 'Saint Ouen', 'Nantes', 'Biarritz', 'Toulon'].sample,
    email: Faker::Internet.email,
  )
end
p 'Fake labs and pharmacies created!'

p 'Creating fake products...'
20.times do
  Product.create(
    name: Faker::Food.dish,
    laboratory_id: rand(1..20),
    lab_selling_price: rand(20..100),
    cost_of_production: rand(1..20)
  )
end
20.times do
  Product.create(
    name: Faker::Food.spice,
    laboratory_id: rand(1..20),
    lab_selling_price: rand(20..100),
    cost_of_production: rand(1..20)
  )
end
20.times do
  Product.create(
    name: Faker::Food.ingredients,
    laboratory_id: rand(1..20),
    lab_selling_price: rand(20..100),
    cost_of_production: rand(1..20)
  )
end
20.times do
  Product.create(
    name: Faker::Food.fruits,
    laboratory_id: rand(1..20),
    lab_selling_price: rand(20..100),
    cost_of_production: rand(1..20)
  )
end
20.times do
  Product.create(
    name: Faker::Food.vegetables,
    laboratory_id: rand(1..20),
    lab_selling_price: rand(20..100),
    cost_of_production: rand(1..20)
  )
end
p 'Fake products created!'

p 'Creating fake sale products...'
Pharmacy.all.each do |pharmacy|
  Product.all.each do |product|
    SaleProduct.create!(
      pharmacy_id: pharmacy.id,
      product_id: product.id,
      stock_count: rand(1..100),
      selling_price: rand(100..200)
    )
  end
end
p 'Fake sale products created!'

p 'Creating fake orders...'
20.times do
  order = Order.new(
    pharmacy: Pharmacy.find(rand(1..20)),
    laboratory: Laboratory.find(rand(1..20)),
  )
  product = order.laboratory.products.sample
  order_product = order.order_products.build(product: product, quantity: rand(10..50))

  if order.valid?
    order.save
    puts "Order and OrderProduct created successfully."
  else
    puts "Order creation failed: #{order.errors.full_messages}"
  end
end
# Un classement des produits les plus rentable pour un laboratoire donné
  # Ca suffit pas. Il faut aussi prendre en compte le nombre de commandes
  # Donc d'abord juste par rapport au cout de production et de vente
  # Ensuite on va faire avec les commandes ( lequel est commandé le plus)


  # Prendre tous les produits d'un laboratoire
  # Pour chaque produit, compter le nombre de commandes
  # Pour chaque produit, compter le nombre de ventes
  # Pour chaque produit, calculer le nombre de ventes / nombre de commandes
  # Pour chaque produit, calculer le nombre de ventes * prix de vente
  # Pour chaque produit, calculer le nombre de ventes * prix de vente - nombre de commandes * prix de vente
  # Pour chaque produit, calculer le nombre de ventes * prix de vente - nombre de commandes * prix de vente - nombre de commandes * prix d'achat

# Un classement des villes puis des 3 meilleures pharmacies (si il y a) pour un laboratoire donnée
