module UsersHelper
  def action_buttons(user)
    case current_user.friendship_status(user)
    when "friends"
      link_to "Cancel Friendship", friendship_path(current_user.friendship_relation(user)), method: :delete
    when "pending"
      link_to "Cancel Request", friendship_path(current_user.friendship_relation(user)), method: :delete
    when "requested"
      link_to "Accept", accept_friendship_path(current_user.friendship_relation(user)), method: :put
    when "not_friends"
        link_to "Add as Friend", friendships_path(user_id: user.id), method: :post
    end
  end
  def get_pic user, area
    user.profile_pic.blank? ? (gravatar_tag user.email, size: area) : (image_tag user.profile_pic, size: area.to_str)
  end

end
