10000.times do |i|
  puts "Creating #{i + 1}/10000 product"
  Product.create name: FFaker::Lorem.words.join(" "),
    in_stock: FFaker::Boolean.sample,
    orders_count: (10..100).to_a.sample
end
