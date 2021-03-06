def purge_database
  User.delete_all
  Article.delete_all
  Category.delete_all
end

def new_admin(username, email, password = "password", admin = false)
  User.create!(
    email: email,
    username: username,
    password: password,
    password_confirmation: password,
    admin: admin
  )
  puts "Created user '#{User.last.username}' with email '#{User.last.email}'."
end

def new_category(name, parent_cat = nil)
  Category.create!(
    name: name,
    user_id: User.first.id,
    parent_id: parent_cat
  )

  if Category.last.parent
    parent_cat = Category.last.parent
    subcats = parent_cat.subcategories.order("display_index ASC")

    if subcats.size == 1
      display_index = 1
    else
      display_index = subcats.last.display_index + 1
    end

    Category.last.update(display_index: display_index)
    puts "Created category '#{Category.last.name}' under category '#{Category.last.parent.name}'."
  else
    Category.last.update(display_index: Category.cat_parents.size || 1)
    puts "Created category '#{Category.last.name}'."
  end
end


def new_article(title, slug, category_id, filename = nil, user_id = User.first.id)
  if filename
    text = File.open("#{Rails.public_path}/html_content/#{filename}.html", "r").readlines.join('').gsub("\n",'')
  else
    text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore"
  end
  Article.create!(
    title: title,
    slug: slug,
    category_id: category_id,
    text: text,
    user_id: user_id
  )

  puts "Created article '#{Article.last.title}' under category '#{Article.last.category}'."
end

puts "Purged old records!" if purge_database

new_admin("ACIDSTEALTH", "acidstealth@gmail.com", "password", true)

new_category("Articles")
  new_category("The Abh", Category.where(name: "Articles").first.id)
    new_article("Society", "Society", Category.where(name: "The Abh").first.id, "Society")
    new_article("Culture", "Culture", Category.where(name: "The Abh").first.id, "Culture")
    new_article("Names", "Names", Category.where(name: "The Abh").first.id, "Names")
    new_article("Clans", "Clans", Category.where(name: "The Abh").first.id, "Clans")
    new_article("Abh Profiles", "Abh Profiles", Category.where(name: "The Abh").first.id, "Abh_Profiles")
    new_article("Human Profiles", "Human Profiles", Category.where(name: "The Abh").first.id, "Human_Profiles")

  new_category("The Empire", Category.where(name: "Articles").first.id)
    new_article("History", "History", Category.where(name: "The Empire").first.id, "Empire_History")
    new_article("Lacmhacarh", "Lacmhacarh", Category.where(name: "The Empire").first.id, "Lacmhacarh")
    new_article("Anthem", "Anthem", Category.where(name: "The Empire").first.id, "Anthem")
    new_article("Rival Nations", "Rival Nations", Category.where(name: "The Empire").first.id, "Rival_Nations")

  new_category("Star Forces", Category.where(name: "Articles").first.id)
    new_article("Overview", "Overview", Category.where(name: "Star Forces").first.id, "Star_Forces")
    new_article("Ships", "Ships", Category.where(name: "Star Forces").first.id, "Ships")
    new_article("Weapons", "Weapons", Category.where(name: "Star Forces").first.id, "Weapons")
    new_article("Anti-Matter", "Anti-Matter", Category.where(name: "Star Forces").first.id, "Anti-Matter")
    new_article("Plane Space", "Plane Space", Category.where(name: "Star Forces").first.id, "Plane_Space")

  new_category("Baronh", Category.where(name: "Articles").first.id)
    new_article("Evolution", "Evolution", Category.where(name: "Baronh").first.id, "Evolution")
    new_article("Measurements", "Measurements", Category.where(name: "Baronh").first.id, "Measurements")
    new_article("Alphabet", "Alphabet", Category.where(name: "Baronh").first.id, "Alphabet")
    new_article("Dictionary", "Dictionary", Category.where(name: "Baronh").first.id)

  new_category("Specials", Category.where(name: "Articles").first.id)
    new_article("Interviews", "Interviews", Category.where(name: "Specials").first.id, "Interview")
    new_article("Song Lyrics", "Song Lyrics", Category.where(name: "Specials").first.id, "Songs")

  new_category("Merchandise", Category.where(name: "Articles").first.id)
    new_article("Novels", "Novels", Category.where(name: "Merchandise").first.id)
    new_article("Soundtracks", "Soundtracks", Category.where(name: "Merchandise").first.id)
    new_article("Radio Dramas", "Radio Dramas", Category.where(name: "Merchandise").first.id)
    new_article("DVDs", "DVDs", Category.where(name: "Merchandise").first.id)
    new_article("Posters", "Posters", Category.where(name: "Merchandise").first.id)
    new_article("Games", "Games", Category.where(name: "Merchandise").first.id)
    new_article("Models", "Models", Category.where(name: "Merchandise").first.id)
    new_article("Misc", "Misc", Category.where(name: "Merchandise").first.id)

new_category("Galleries")

new_category("Resources")
  new_category("Series Reviews", Category.where(name: "Resources").first.id)
  new_category("Novel Reviews", Category.where(name: "Resources").first.id)
  new_category("Manga Reviews", Category.where(name: "Resources").first.id)
  new_category("Fan Fiction", Category.where(name: "Resources").first.id)
  new_category("Downloads", Category.where(name: "Resources").first.id)

new_category("Forum")

new_category("About")
  new_category("About Us", Category.where(name: "About").first.id)
    new_article("Blog: Lacmhacarh", "Blog: Lacmhacarh", Category.where(name: "About").first.id)
    new_article("National Archive", "National Archive", Category.where(name: "About").first.id)

  new_category("Government", Category.where(name: "About").first.id)
    new_article("Constitution", "Constitution", Category.where(name: "Government").first.id)
    new_article("Forum Rules", "Forum Rules", Category.where(name: "Government").first.id)
    new_article("Moderator Rules", "Moderator Rules", Category.where(name: "Government").first.id)
    new_article("Staff", "Staff", Category.where(name: "Government").first.id)
    new_article("Immigration", "Immigration", Category.where(name: "Government").first.id)
    new_article("DEFCON", "DEFCON", Category.where(name: "Government").first.id)
