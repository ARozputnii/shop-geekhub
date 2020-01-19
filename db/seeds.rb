if User.find_by(email: 'admin@example.com').nil?
  User.create([email: 'admin@example.com', password: 'adminpass', password_confirmation: 'adminpass', admin: true])
else
  puts 'User already exist'
end

Category.create([{ title: 'Book', description: 'desc' }, { title: 'Magazine', description: 'desc' }, { title: 'Manga', description: 'desc' }])

10.times do
  Product.create([{
                   title: Faker::Book.title,
                   description: Faker::Quotes::Shakespeare.king_richard_iii_quote,
                   price: rand(300..999),
                   category_id: 1
                 }])
end
10.times do
  Product.create([{
                   title: Faker::Book.title,
                   description: Faker::Quotes::Shakespeare.as_you_like_it_quote,
                   price: rand(300..1999),
                   category_id: 2
                 }])
end
10.times do
  Product.create([{
                   title: Faker::Book.title,
                   description: Faker::Quotes::Shakespeare.romeo_and_juliet_quote,
                   price: rand(300..1999),
                   category_id: 3
                 }])
end

30.times do
  User.create([{ email: 'user' + rand(100..400).to_s + '@example.com', password: 'Userexample' }])
end

60.times do
  Comment.create([{
                      product_id: rand(1..30),
                      user_id: rand(1..30),
                      rating: rand(1..5),
                      body: Faker::Quotes::Shakespeare.king_richard_iii_quote
                  }])
end