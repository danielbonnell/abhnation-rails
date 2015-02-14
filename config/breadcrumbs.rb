crumb :root do
  link "The Abh Nation", root_path
  if request.path.split('/').include?('admin') && current_user && current_user.admin?
    link "CIC", admin_root_path
  end
end

crumb :categories do
  link "Categories", categories_path
end

crumb :category do |category|
  if params[:controller] == "admin/articles"
    # Check if category is a parent or child
    if params[:category_id]
      # If params[:category_id] is present, category is a child
      category = Category.find(params[:category_id])
    elsif params[:id]
      # If params[:category_id] is not present, category is a parent
      category = Article.find(params[:id]).category
    else
      # If there are no params, then the page must be the new_admin_category_path
      category = "Create"
    end

    # Set parent category is category is a child
    if defined?(category.parent) && !category.parent.nil?
      link category.parent.name, admin_categories_path
    end

    if params[:id] || params[:category_id]
      link category.name, admin_categories_path
    end
  end

  if params[:controller] != "admin/articles"
    if params[:action] == "new"
      link "Categories", admin_categories_path
    end
    # Check if category is a parent or child
    if params[:category_id]
      # If params[:category_id] is present, category is a child
      category = Category.find(params[:category_id])
    elsif params[:id]
      # If params[:category_id] is not present, category is a parent
      category = Category.find(params[:id])
    else
      # If there are no params, then the page must be the new_admin_category_path
      category = "Create"
    end

    # Set parent category is category is a child
    if defined?(category.parent) && !category.parent.nil?
      link category.parent.name, category_path(category.parent)
    end

    if params[:id] || params[:category_id]
      link category.name, category
    else
      link "Create", category
    end
  end
end

crumb :articles do
  if params[:controller] != "admin/articles"
    link Article.find(params[:id]).category.name, category_articles_path
  else
    link "Articles", admin_articles_path
  end
end

crumb :article do |article|
  if params[:action] == "new"
    link "Article", admin_articles_path
    link "Create", new_admin_article_path
  elsif params[:id] && params[:controller] != "admin/articles"
    link article.slug, category_article_path(article.category, article)
  elsif params[:controller] != "admin/articles"
    link article.slug, [article.category, article]
  elsif params[:action] == "edit"
    link article.slug, edit_admin_article_path(article.category, article)
    link "Edit", admin_categories_path
  elsif params[:controller] == "admin/articles" && params[:action] != "new"
    link "Articles", admin_articles_path
  else
    link "Articles", admin_articles_path
    link "Create", new_admin_article_path
  end
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
