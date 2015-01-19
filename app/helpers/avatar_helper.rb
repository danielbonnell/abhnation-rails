module AvatarHelper
  def avatar(user_type, size = 150)
    if !user_type.avatar.url.nil?
      image_tag user_type.avatar.url,
      alt: "#{user_type.username}'s Avatar",
      size: "#{size}"
    else
      image_tag user_type.gravatar_url(size: size),
      alt: "#{user_type.username}'s Gravatar"
    end
  end
end
