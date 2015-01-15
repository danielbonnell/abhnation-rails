module NavbarHelper
  def show_navbar
    output = []
    Category.where("parent_id is NULL").each do |category|
      subcategories = Category.where("parent_id = ?", category.id)
      output << "
        <li class=\"has-dropdown\">
          <% link_to category.name, category_path(category) %>
          <ul class=\"dropdown\">
            <li class=\"title back js-generated\">
              <h5><a href=\"javascript:void(0)\">Back</a></h5>
              <% link_to category.name, category_path(category) %>
            </li>
            <% subcategories.each do |subcategory| %>
              <li><% link_to subcategory.name, category_path(subcategory) %></li>
                <ul class=\"dropdown\">
                  <li class=\"title back js-generated\">
                    <h5><a href=\"javascript:void(0)\">Back</a></h5>
                  </li>
                  <% subcategories.each do |subcategory| %>
                    <% articles = Article.where(category_id: subcategory.id) %>
                    <% articles.each do |article| %>
                      <% link_to article.title, article_path(article) %>
                    <% end %>
                  <% end %>
                </ul>
              </li>
            <% end %>
          </ul>
        </li>
      "
    end
    output = output.join('').gsub("\n", "").html_safe
  end
end
