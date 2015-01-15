4.times do |n|
  password = Faker::Internet.password
  User.create!(
    email: Faker::Internet.email,
    username: Faker::Internet.user_name,
    password: password,
    password_confirmation: password
  )

  Category.create!(
    name: "Category #A#{n}",
    user_id: User.last.id
  )

  3.times do |m|
    Article.create!(
      title: "Article Title #A#{n}#{m}",
      slug: "Article #A#{n}#{m}",
      text: Faker::Lorem.words(100),
      category_id: Category.last.id,
      user_id: User.last.id
    )
  end
end

5.times do |n|
  subcat = Category.create!(
    name: "Subcategory ##{n}",
    parent_id: Category.first.id,
    user_id: User.last.id
  )

  5.times do |m|
    Article.create!(
      title: "Subcategory Article ##{n}#{m}",
      slug: "Subcat Art. ##{n}#{m}",
      text: Faker::Lorem.words(100),
      category_id: subcat.id,
      user_id: User.last.id
    )
  end
end
