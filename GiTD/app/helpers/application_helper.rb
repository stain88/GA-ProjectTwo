module ApplicationHelper

  def get_pic(user, area="100x100")
    user.profile_pic.blank? ? (gravatar_tag user.email, size: area, d: "identicon") : (image_tag user.profile_pic, size: area.to_s)
  end

end
