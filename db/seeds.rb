if User.find_by(email: 'admin@example.com').nil?
  User.create([email: 'admin@example.com', password: 'adminpass', password_confirmation: 'adminpass', admin: true])
else
  puts 'User already exist'
end

Category.create([{ title: 'Book', description: 'desc' }, { title: 'Magazine', description: 'desc' }, { title: 'Manga', description: 'desc' }])

10.times do
  Product.create([{
                   title: Faker::Book.title,
                   description: Faker::Quotes::Shakespeare.king_richard_iii_quote + 'Lorem ipsum dolor sit amet,
                                consectetur adipiscing elit,
                                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                Ut enim ad minim veniam,
                                quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
                   price: rand(300..999),
                   category_id: 1
                 }])
end
10.times do
  Product.create([{
                   title: Faker::Book.title,
                   description: Faker::Quotes::Shakespeare.king_richard_iii_quote + 'Lorem ipsum dolor sit amet,
                                consectetur adipiscing elit,
                                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                Ut enim ad minim veniam,
                                quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',                   price: rand(300..1999),
                   category_id: 2
                 }])
end
10.times do
  Product.create([{
                   title: Faker::Book.title,
                   description: Faker::Quotes::Shakespeare.king_richard_iii_quote + 'Lorem ipsum dolor sit amet,
                                consectetur adipiscing elit,
                                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                Ut enim ad minim veniam,
                                quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',                   price: rand(300..1999),
                   category_id: 3
                 }])
end

30.times do
  User.create([{ email: 'user' + rand(100..400).to_s + '@example.com', password: 'Userexample' }])
end

80.times do
  Comment.create([{
                   product_id: rand(1..30),
                   commenter: Faker::Name.name,
                   rating: rand(1..5),
                   body: Faker::Quotes::Shakespeare.king_richard_iii_quote
                 }])
end
