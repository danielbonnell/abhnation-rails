module AvatarHelper
  def avatar(size = 150)
    if !current_user.avatar_link.nil? && !current_user.avatar_link.empty?
      image_tag current_user.avatar_link,
      alt: "#{current_user.username}'s Avatar (linked)",
      size: "#{size}"
    elsif !current_user.avatar.url.nil?
      image_tag current_user.avatar.url,
      alt: "#{current_user.username}'s Avatar",
      size: "#{size}"
    else
      image_tag current_user.gravatar_url(size: size),
      alt: "#{current_user.username}'s Gravatar"
    end
  end
end
