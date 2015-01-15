3.times do
  password = Faker::Internet.password
  User.create!(
    email: Faker::Internet.email,
    username: Faker::Internet.user_name,
    password: password,
    password_confirmation: password
  )

  Category.create!(
    name: Faker::Lorem.characters(10),
    user_id: User.last.id
  )

  Article.create!(
    title: Faker::Lorem.characters(10),
    slug: Faker::Lorem.characters(10),
    text: Faker::Lorem.words(100),
    category_id: Category.last.id,
    user_id: User.last.id
  )
end

10.times do
  Category.create!(
    name: Faker::Lorem.characters(10),
    parent_id: Category.last.id,
    user_id: User.last.id
  )

  Article.create!(
    title: Faker::Lorem.characters(10),
    slug: Faker::Lorem.characters(10),
    text: Faker::Lorem.words(100),
    category_id: Category.last.id,
    user_id: User.last.id
  )
end
