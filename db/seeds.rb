100.times do |i|
  puts "Creating #{i + 1}/100 store"
  Store.create name: FFaker::Lorem.words.join(" "),
    description: FFaker::Lorem.sentence
end

10000.times do |i|
  puts "Creating #{i + 1}/10000 product"
  Product.create name: FFaker::Lorem.words.join(" "),
    store: Store.all.sample,
    in_stock: FFaker::Boolean.sample,
    orders_count: (10..100).to_a.sample
end
