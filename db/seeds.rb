100.times do
  Product.create name: FFaker::Lorem.words.join(" ")
end
