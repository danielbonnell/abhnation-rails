crumb :root do
  link "The Abh Nation", root_path
  if request.path.split('/').include?('admin') && current_user.admin?
    link "Bridge", admin_root_path
  end
end

crumb :categories do
  link Category.find(params[:id]).name, categories_path
end

crumb :category do |category|
  # Check if category is a parent or child
  if params[:category_id]
    # If params[:category_id] is present, category is a child
    category = Category.find(params[:category_id])
  else
    # If params[:category_id] is not present, category is a parent
    category = Category.find(params[:id])
  end

  # Set parent category is category is a child
  if defined?(category.parent) && !category.parent.nil?
    link category.parent.name, category_path(category.parent)
  end

  link category.name, category
end

crumb :articles do
  link Article.find(params[:id]).category.name, category_articles_path
end

crumb :article do |article|
  link article.slug, [article.category, article]
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
