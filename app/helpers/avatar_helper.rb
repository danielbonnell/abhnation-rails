module AvatarHelper
  def avatar
    image_tag current_user.gravatar_url,
    alt: "#{current_user.email}'s Avatar"
  end
end
