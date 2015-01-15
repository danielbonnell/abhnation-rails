4.times do |n|
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
    slug: "Article #{n}",
    text: Faker::Lorem.words(100),
    category_id: Category.last.id,
    user_id: User.last.id
  )
end

5.times do |n|
  subcat = Category.create!(
    name: Faker::Lorem.characters(10),
    parent_id: Category.first.id,
    user_id: User.last.id
  )

  5.times do |m|
    Article.create!(
      title: Faker::Lorem.characters(10),
      slug: "Subcat Art. #{n}#{m}",
      text: Faker::Lorem.words(100),
      category_id: subcat.id,
      user_id: User.last.id
    )
  end
end
