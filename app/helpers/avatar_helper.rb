module AvatarHelper
  def avatar
    unless current_user.avatar.nil?
      image_tag current_user.avatar,
      alt: "#{current_user.username}'s Avatar"
    else
      image_tag current_user.gravatar_url(size: 150),
      alt: "#{current_user.username}'s Avatar"
    end
  end
end
