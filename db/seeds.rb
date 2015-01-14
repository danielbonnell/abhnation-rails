User.create!(
  email: "acidstealth@gmail.com",
  username: "ACIDSTEALTH",
  password: "password",
  password_confirmation: "password"
)

Category.create!(
  name: "Fake Category",
  user_id: User.find_by(username: "ACIDSTEALTH").id
)

Category.create!(
  name: "Fake Category 2",
  user_id: User.find_by(username: "ACIDSTEALTH").id
)

Category.create!(
  name: "Fake Subcat.",
  parent_id: Category.find_by(name: "Fake Category").id,
  user_id: User.find_by(username: "ACIDSTEALTH").id
)

Article.create!(
  title: "Example Article",
  slug: "Example Article",
  text: Faker::Lorem.words(100).join(' '),
  category_id: Category.find_by(name: "Fake Subcat.").id,
  user_id: User.find_by(username: "ACIDSTEALTH").id
)

Article.create!(
  title: "Fake Article 2",
  slug: "Fake Article 2",
  text: Faker::Lorem.words(100).join(' '),
  category_id: Category.find_by(name: "Fake Category 2").id,
  user_id: User.find_by(username: "ACIDSTEALTH").id
)
