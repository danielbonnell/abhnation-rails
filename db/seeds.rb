User.create!(
  email: "acidstealth@gmail.com",
  username: "ACIDSTEALTH",
  password: "password",
  password_confirmation: "password"
)

Category.create!(
  name: "Category",
  user_id: User.find_by(username: "ACIDSTEALTH").id
)

Subcategory.create!(
  name: "Subcategory",
  category_id: Category.find_by(name: "Category").id,
  user_id: User.find_by(username: "ACIDSTEALTH").id
)

Article.create!(
  title: "Example Article",
  slug: "Example Article",
  text: Faker::Lorem.words(100).join(' '),
  category_id: Category.find_by(name: "Category").id,
  subcategory_id: Subcategory.find_by(name: "Subcategory").id,
  user_id: User.find_by(username: "ACIDSTEALTH").id
)
