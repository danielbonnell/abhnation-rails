module NavbarHelper
  def show_navbar
    output = []
    Category.where("parent_id is NULL").each do |category|
      subcategories = Category.where("parent_id = ?", category.id)
      articles = Article.where(category_id: category.id)
      output << %{
        <li class=\"has-dropdown\">
          #{link_to category.name, category_path(category)}
          <ul class=\"dropdown\">
            <li class=\"title back js-generated\">
              <h5><a href=\"javascript:void(0)\">Back</a></h5>
              #{link_to category.name, category_path(category)}
            </li>
      }

      subcategories.each do |subcategory|
        articles = Article.where(category_id: subcategory.id)
        output << %{
              <li class="has-dropdown">
                #{link_to subcategory.name, category_path(subcategory)}
                <ul class=\"dropdown\">
                  <li class=\"title back js-generated\">
                    <h5><a href=\"javascript:void(0)\">Back</a></h5>
                  </li>
        }
        articles.each do |article|
          output << %{
                  <li>
                    #{link_to article.slug, article_path(article)}
                  </li>
          }
        end
        output << %{
                </ul>
              </li>
        }
      end
      articles.each do |article|
        output << %{
                <li>
                  #{link_to article.slug, article_path(article)}
                </li>
        }
      end
      output << %{
          </ul>
        </li>
      }
    end
    output = output.join('').gsub("\n", "").html_safe
  end
end
