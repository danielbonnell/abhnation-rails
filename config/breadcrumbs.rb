crumb :root do
  link "The Abh Nation", root_path
end

crumb :category do
  link "Categories", categories_path
end

crumb :category do |category|
  link category.name, category
  parent :categories
end

crumb :subcategories do
  link Article.find(params[:id]).subcategory.name, subcategories_path
end

crumb :subcategory do |subcategory|
  link subcategory.name, subcategory
  parent :subcategories
end

crumb :articles do
  link Article.find(params[:id]).category.name, articles_path
end

crumb :article do |article|
  link article.title, article
  parent :articles
end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
