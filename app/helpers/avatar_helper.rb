module AvatarHelper
  def avatar
    image_tag current_user.gravatar_url(size: 150),
    alt: "#{current_user.email}'s Avatar"
  end
end
