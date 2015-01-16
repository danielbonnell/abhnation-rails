crumb :root do
  link "The Abh Nation", root_path
end

crumb :category do
  article = Article.find(params[:id])

  if !article.category.parent_id.nil?
    parent = article.category.parent_id
    parent = Category.find(parent).name
    link parent, categories_path
  end

  link article.category.name, categories_path
end

crumb :articles do
  link Article.find(params[:id]).category.name, articles_path
end

crumb :article do |article|
  link article.slug, article
  parent :category
end

crumb :users do
  link "Users", users_path
  parent :root
end

crumb :user do |user|
  link user.username, user
  parent :users
end

crumb :edit_user do |edit_user|
  link edit_user.username, edit_user
  link "Edit Profile", edit_user
  parent :users
end

crumb :log_in do |log_in|
  link "Log in", log_in
  parent :root
end

crumb :registration do |registration|
  link "Register", registration
  parent :root
end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
